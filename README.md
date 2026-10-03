
Calcit Workflow
----

> 使用正式 Calcit 0.28.0，支持原生执行与生成 JavaScript。

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
CI 检查两个原生入口、全部 8 个业务定义、规范格式及原加法测试的 native/JS 执行。
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
