# Contributing

Don't know where to start? Check issues labeled [`help wanted`](https://github.com/awesome-selfhosted/awesome-selfhosted-data/issues?q=is%3Aissue+is%3Aopen+label%3A%22help+wanted%22), [`bug`](https://github.com/awesome-selfhosted/awesome-selfhosted-data/issues?q=is%3Aissue+is%3Aopen+label%3Abug) and [`curation`](https://github.com/awesome-selfhosted/awesome-selfhosted-data/issues?q=is%3Aissue+is%3Aopen+label%3Acuration).

### Curation

- Software with no development activity for 6-12 months may be removed from the list
- Non-working software may be removed from the list
- Unmaintained software without an active community may be removed from the list
- Software with persistent, serious security issues will be removed from the list
- Problems should be reported automatically: [![](https://github.com/awesome-selfhosted/awesome-selfhosted-data/actions/workflows/check-dead-links.yml/badge.svg)](https://github.com/awesome-selfhosted/awesome-selfhosted-data/issues/1) [![](https://github.com/awesome-selfhosted/awesome-selfhosted-data/actions/workflows/check-unmaintained-projects.yml/badge.svg)](https://github.com/awesome-selfhosted/awesome-selfhosted-data/issues/1)

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


### Domain name costs

You can help cover domain name registration and renewal costs by pledging a small amount on [Liberapay ![](https://img.shields.io/liberapay/goal/awesome-selfhosted?logo=liberapay) ![](https://img.shields.io/liberapay/receives/awesome-selfhosted?logo=liberapay)](https://liberapay.com/awesome-selfhosted/)


### Other guidelines

In addition to guidelines listed in the [Pull Request template](.github/PULL_REQUEST_TEMPLATE.md), these general rules help keep the list consistent:
- Please avoid redundant terms in project descriptions, such as _open-source_, _free_, _self-hosted_... as their presence on awesome-selfhosted already implies this.
- Prefer shorter forms for descriptions - for example, `Minimalist text adventure game` would be preferred to `A minimalist text adventure game` or `$PROJECT is a minimalist text adventure game`).
- If the the project has no documentation in English, please add `(documentation in $LANGUAGE)` at the end of the description.
- If the project is presented as an alternative to another service or application, please mention it as `(alternative to $PRODUCT1, $PRODUCT2)` at the end of the description.
- If you are adding software forked from another active project, please provide/link to a clear list of differences between both.
- If the project is forked from another project, please add `(fork of $PROJECT)` at the end of the description.
- If the project distributes a single static binary, please add the programming language in which it is written.

### What does not qualify

- Software that depends on a specific cloud provider
- Software that is a desktop, mobile, or command-line application, which relies on a separate file synchronisation/server program
- Software that requires you to write application code before producing a working end-user application (libraries, SDKs, ...)
- Software acts as a platform to build and deploy arbitrary applications (PaaS, "serverless"...)
- Anything that is a generic container/deployment automation/virtualization/... tool is better suited for [awesome-sysadmin](https://github.com/awesome-foss/awesome-sysadmin)
- Software contributions that merely port an existing application to another system (e.g., Dockerization)

### Canned replies

To save maintainers time, a few premade replies for common issues can be found below

#### No tagged releases

>Hi, thanks for your contribution.
>
>However, there are no tagged releases for this project. Our guidelines require that _Any software project you are adding was first released more than 4 months ago._ We encourage you to create a release now and/or a simple [changelog](https://keepachangelog.com/en/1.1.0/) that will help users keep track of changes in the software (especially breaking changes or changes requiring configuration tweaks), and will allow administrators to install a known working, unchanging version (as opposed to always installing the latest development version).
>
>Once this is done, the project may be resubmitted to awesome-selfhosted when the first release reaches the age of 4 months.
>
>Thanks for understanding, and good luck with this project.

#### First release less than 4 months old

>Hi, thanks for your contribution.
>
>Currently, this project has a release, but it is not yet 4 months old. Our guidelines require that Any software project you are adding was first released more than 4 months ago. This count initiates only after a release has been created to ensure users need not rely on the latest development version to use the project.
>
>I'll go ahead and close it for now to keep the PR section focused on active tasks. Once the first release is four months old, feel free to resubmit it to awesome-selfhosted, or you can create an issue instead (we don't close issues; we just tag them to indicate they need to mature).
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