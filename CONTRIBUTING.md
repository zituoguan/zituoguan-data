# 贡献

不知道从哪里开始？请检查标有 [`help wanted`](https://github.com/awesome-selfhosted/awesome-selfhosted-data/issues?q=is%3Aissue+is%3Aopen+label%3A%22help+wanted%22)、[`bug`](https://github.com/awesome-selfhosted/awesome-selfhosted-data/issues?q=is%3Aissue+is%3Aopen+label%3Abug) 和 [`curation`](https://github.com/awesome-selfhosted/awesome-selfhosted-data/issues?q=is%3Aissue+is%3Aopen+label%3Acuration) 的问题。

### 整理

-   超过 6-12 个月没有开发活动的软件可能会从列表中移除
-   无法正常工作的软件可能会从列表中移除
-   没有活跃社区且无人维护的软件可能会从列表中移除
-   存在持续、严重安全问题的软件将从列表中移除
-   问题应自动报告：[![](https://github.com/awesome-selfhosted/awesome-selfhosted-data/actions/workflows/check-dead-links.yml/badge.svg)](https://github.com/awesome-selfhosted/awesome-selfhosted-data/issues/1) [![](https://github.com/awesome-selfhosted/awesome-selfhosted-data/actions/workflows/check-unmaintained-projects.yml/badge.svg)](https://github.com/awesome-selfhosted/awesome-selfhosted-data/issues/1)

### 添加软件到列表

-   基于 [.github/ISSUE_TEMPLATES/addition.md](.github/ISSUE_TEMPLATE/addition.md) 中的模板，[创建一个新的 `software/software-name.yml` 文件](https://github.com/awesome-selfhosted/awesome-selfhosted-data/new/master/software)。请使用 [kebab-case](https://en.wikipedia.org/wiki/Letter_case#Kebab_case) 命名文件，例如 `my-awesome-software.yml`。
-   删除注释和未使用的可选字段
-   输入描述性的提交信息（例如 `add My Awesome software`）
-   选择 `Create a new branch for this commit and start a pull request`
-   点击 `Propose new file`
-   点击 `Create pull request`

如果您不习惯发送拉取请求，请创建一个新的 [issue](https://github.com/awesome-selfhosted/awesome-selfhosted-data/issues)。

在 [单页模式](https://github.com/awesome-selfhosted/awesome-selfhosted) 下，软件将仅显示在其 `tags` 列表中的第一个类别下，所以要谨慎选择。

### 添加标签/类别

标签代表软件的功能类别/特性，必须添加到 `tags/tag-name.yml` 中（参考 [现有标签](tags/) 作为示例）。任何标签必须至少有 3 个软件项目引用。[`Miscellaneous`](tags/miscellaneous.yml) 标签可用于不匹配任何现有类别的软件。

```yaml
# 项目名称
name: 项目管理
# 此标签/类别的描述（允许使用 markdown）
description: '[项目管理](https://en.wikipedia.org/wiki/Project_management) 是领导团队工作以在给定约束条件下实现所有项目目标的过程。'
# (可选) 相关标签列表，按名称
related_tags:
  - 票务
  - 任务管理与待办事项列表
# (可选) 外部链接
external_links:
  - title: awesome-sysadmin/代码审查
    url: https://github.com/awesome-foss/awesome-sysadmin#code-review
# (可选) 如果设置此项，软件项目将无法引用此标签，页面将显示一个提示框，要求访问这些链接
redirect:
  - title: awesome-sysadmin/持续集成与持续部署
    url: https://github.com/awesome-foss/awesome-sysadmin#continuous-integration--continuous-deployment

```

### 添加许可证

[自由和开源](https://en.wikipedia.org/wiki/Free_and_open-source_software) 软件许可证（最好使用 [SPDX 标识符](https://spdx.org/licenses/)，或自定义许可证，必须添加到 `licenses.yml` 中（参考 [现有许可证](licenses.yml) 作为示例）：

```yaml
  # 简短许可证标识符
- identifier: ZPL-1.2
  # 完整许可证名称
  name: Zope 公共许可证 1.2
  # 完整许可证文本的链接
  url: http://zpl.pub/page/zplv12
```

### 添加语言/平台

运行或构建软件所需的语言/要求/技术应列在 `platforms/platform-name.yml` 中（参考 [现有平台](platforms/) 作为示例）：

```yaml
# 语言/平台名称
name: Java
# 编程语言或部署平台的通用描述（允许使用 markdown）
description: "[Java](https://en.wikipedia.org/wiki/Java_(programming_language)) 是一种高级、基于类的面向对象编程语言，旨在尽可能减少实现依赖。"
```

### 从列表中移除软件

只需删除 `software/` 下的相应文件并提交一个拉取请求。
要从 Github 的 Web 界面执行此操作：
-   使用 [转到文件](https://github.com/awesome-selfhosted/awesome-selfhosted-data?search=1) 功能打开相应的文件（例如 [`software/redash.yml`](https://github.com/awesome-selfhosted/awesome-selfhosted-data/blob/master/software/redash.yml)）
-   点击文件视图右上角的 `...` 按钮，然后点击 `Delete file`
-   在 `Commit changes` 对话框中，输入 `Remove SOFTWARE_NAME (reason)` 作为您的提交消息，在 `extended description` 字段中添加额外上下文，选择 `Create a new branch for this commit and start a pull request.`，然后点击 `Commit Changes`


### 域名费用

您可以通过在 [Liberapay ![](https://img.shields.io/liberapay/goal/awesome-selfhosted?logo=liberapay) ![](https://img.shields.io/liberapay/receives/awesome-selfhosted?logo=liberapay)](https://liberapay.com/awesome-selfhosted/) 上认捐少量金额来帮助支付域名注册和续订费用。


### 其他指南

除了 [拉取请求模板](.github/PULL_REQUEST_TEMPLATE.md) 中列出的指南外，这些通用规则有助于保持列表的一致性：
-   请避免在项目描述中使用冗余术语，例如 _开源_、_免费_、_自托管_... 因为它们在 awesome-selfhosted 上的出现已经暗示了这一点。
-   描述请使用更短的形式 - 例如，`简约文本冒险游戏` 比 `一个简约的文本冒险游戏` 或 `$PROJECT 是一个简约的文本冒险游戏` 更受欢迎）。
-   如果项目没有英文文档，请在描述末尾添加 `(文档语言为 $LANGUAGE)`。
-   如果项目是作为另一个服务或应用程序的替代品呈现的，请在描述末尾提及 `(替代 $PRODUCT1, $PRODUCT2)`。
-   如果您添加的软件是从另一个活动项目派生的，请提供/链接到两者之间差异的清晰列表。
-   如果项目是从另一个项目派生的，请在描述末尾添加 `(派生自 $PROJECT)`。
-   如果项目分发单个静态二进制文件，请添加其编写的编程语言。

### 不符合条件的内容

-   依赖特定云提供商的软件
-   作为桌面、移动或命令行应用程序，依赖于单独的文件同步/服务器程序的软件
-   在生成可工作的最终用户应用程序之前需要您编写应用程序代码的软件（库、SDK 等）
-   充当构建和部署任意应用程序的平台的软件（PaaS、“无服务器”等）
-   任何通用的容器/部署自动化/虚拟化/... 工具更适合 [awesome-sysadmin](https://github.com/awesome-foss/awesome-sysadmin)
-   仅仅是将现有应用程序移植到另一个系统（例如，Docker 化）的软件贡献

### 预设回复

为了节省维护者的时间，下面提供了一些针对常见问题的预制回复

#### 没有标记的版本

>您好，感谢您的贡献。
>
>然而，该项目没有标记版本。我们的指南要求 _您添加的任何软件项目首次发布超过 4 个月。_ 我们鼓励您现在创建版本和/或一个简单的 [变更日志](https://keepachangelog.com/en/1.1.0/)，以帮助用户跟踪软件变更（特别是重大变更或需要配置调整的变更），并允许管理员安装已知可用的稳定版本（而不是总是安装最新开发版本）。
>
>完成后，当首次发布达到 4 个月时，该项目可重新提交至 awesome-selfhosted。
>
>感谢您的理解，祝项目顺利。

### 其他操作

**重命名标签/类别：** 必须在相应的 `tags/mytag.yml` 文件中重命名标签。所有引用必须在 `tags/*.yml` 和 `software/*.yml` 中更新。

**自动化任务：**

```bash
$ make help
install             在虚拟环境中安装构建工具
import              从原始列表导入数据 https://github.com/awesome-selfhosted/awesome-selfhosted
update_metadata     从项目仓库/API 更新元数据
awesome_lint        根据 awesome-selfhosted 指南检查数据
export_markdown     从 YAML 数据渲染 markdown 导出 (https://github.com/awesome-selfhosted/awesome-selfhosted)
export_html         从 YAML 数据渲染 HTML 导出 (https://awesome-selfhosted.net)
push_markdown       提交并推送更改到 markdown 仓库
push_html           提交并推送更改到 HTML 站点仓库（修改上次提交并强制推送）
url_check           检查 URL 是否存在死链或其他连接问题
authors             更新 AUTHORS 文件
clean               清理自动化任务生成的文件
help                生成带有描述的目标列表
```