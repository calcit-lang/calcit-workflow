# Calcit Workflow

正式 Calcit **0.32.1** 的原生与 JavaScript 测试模板。

## 对使用者的影响

CLI 与 `@calcit/procs` 配对升级到 0.32.1，需重新安装依赖并生成 JS。
标准库继续使用已发布的 `calcit.std` 0.2.46，原生 dylib 必须匹配运行平台；Linux CI 不代表所有平台都已验收。
不使用 main、hash 或 alpha 模块版本，不发布模板新版本，也不部署应用。

本次 Snapshot、八个业务定义的 schema、原加法测试和定时器逻辑不变。
0.32 类型语法已在前轮通过官方 format 迁移；本轮保留原严格检查，不新增改写规则或验证脚本。
删除旧 `@calcit/procs@0.31.0` 的安装年龄豁免，统一使用用户确认的一小时等待门禁，无单包例外。
该门禁适用于新解析的版本；`yarn install --immutable` 可复用 lockfile 的已有解析，不会逐次重新核对包发布时间。

## 使用

```sh
caps --strict --ci
corepack yarn install --immutable
caps verify --toolchain
calcit calcit.cirru
```

默认入口注册原两秒定时器，使用标准库首选 `set-interval!`，回调及 reload 返回 Unit。
持续编辑可运行 `calcit calcit.cirru -w`；使用有限时长的测试入口可运行：

```sh
calcit calcit.cirru --entry test
calcit calcit.cirru --entry test js
node main.mjs
```

默认原生入口需 std 的平台 dylib；JS 只验证独立测试入口，不将它当作默认定时器的 JS 验收。
std 安装按精确依赖和 `--locked` 构建，不能隐式修改 Cargo lock。

## 验证范围

原 CI 保留 canonical、15 个全定义、完整 strict、独立 test 入口和全部八个业务定义检查，以及原 native/JS 加法测试。
默认原生入口另运行五秒，确认打印原两秒定时器回调后终止测试进程；这不改变源码的定时行为。
本项目没有附带定义测试，不把零匹配称作测试通过。

本地已用 Caps 严格解析发布依赖并验证 0.32.1 工具链配对，不可变安装、上述类型/运行检查均通过。
跨平台原生运行仍应在目标平台验收，最终 Linux 结果以本 PR CI 为准。

源码只维护 `calcit.cirru` / `deps.cirru`，`js-out` 是忽略的生成目录。
本模板没有浏览器部署产物，不添加 COS/CDN；前端模板参考 [respo-calcit-workflow](https://github.com/calcit-lang/respo-calcit-workflow)。
CI 使用精确正式 Action tag，接受 tag 可移动的风险，不添加忽略检查配置。

## License

MIT
