
Calcit Workflow
----

> 配对使用正式 Calcit 0.30.1，支持原生执行与测试入口生成 JavaScript。

使用者影响：CLI 与 `@calcit/procs` 同步固定为正式 `0.30.1`，
模块依赖升级到正式 `calcit.std` `0.2.44`，不使用 main、hash 或 alpha 模块版本。
std 的安装构建现在使用 `--locked`，依赖锁文件需要调整时会失败，不再隐式修改。
目标机器仍需匹配的 native dylib；Linux CI 不代表所有平台均已完成 runtime 验收，
本轮也不创建模板新版本或部署应用。
保留原定时器行为、严格类型检查及原 native/JS 加法测试，不新增验证脚本。
定时器使用正式模块的首选 `set-interval!`，保留原两秒间隔；打印 callback 与
reload 函数返回真实 `Unit`。完整 strict workflow 由 CI 直接检查。

### Usages

Install [Calcit](https://github.com/calcit-lang/calcit) to run demo:

```bash
caps --strict --ci
corepack yarn install --immutable
caps verify --toolchain

calcit calcit.cirru # run once

calcit calcit.cirru -w # run and watch
```

run tests:

```bash
calcit calcit.cirru --entry test
```

run test in JavaScript:

```bash
calcit calcit.cirru --entry test js # emit JS once
node main.mjs # run code
```

默认入口会注册定时器；执行有限时长测试使用独立 `test` entry。
默认入口通过 std 原生动态库执行定时器；JS 验证只覆盖有限测试入口，
不代表默认定时器入口已在 JS 后端验证。原生动态库须与运行平台匹配。
CI 检查两个原生入口、全部 8 个业务定义、规范格式及原加法测试的 native/JS 执行。
另外直接运行原生默认入口 5 秒，确认原两秒定时器实际打印回调后结束；
这项有限时长验收不改变源码的定时行为，也不是默认入口的 JS 验收。
本项目没有附带定义测试，不能把零匹配当作测试通过。
不增加统计报告、额外验证脚本或新迁移规则。

源码只维护 `calcit.cirru` / `deps.cirru`，`js-out` 是忽略的生成目录。
此模板没有浏览器部署产物，因此不添加 COS/CDN 配置；前端项目参考
[respo-calcit-workflow](https://github.com/calcit-lang/respo-calcit-workflow)。
CI 使用正式 Action 标签，标签仍可能移动，并非不可变供应链身份。

### Workflow

https://github.com/calcit-lang/calcit-workflow

### License

MIT
