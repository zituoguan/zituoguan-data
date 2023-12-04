# 贡献

不知道从哪里开始？查看标记为 [`help wanted`](https://github.com/awesome-selfhosted/awesome-selfhosted-data/issues?q=is%3Aissue+is%3Aopen+label%3A%22help+wanted%22)、[`fix`](https://github.com/awesome-selfhosted/awesome-selfhosted-data/issues?q=is%3Aissue+is%3Aopen+label%3Afix) 和 [`curation`](https://github.com/awesome-selfhosted/awesome-selfhosted-data/issues?q=is%3Aissue+is%3Aopen+label%3Acuration) 的问题。

请在[awesome-selfhosted-data](https://github.com/awesome-selfhosted/awesome-selfhosted-data)提交，本项目仅用于中文翻译和输出

### 策展

- 超过 6-12 个月没有开发活动的软件可能会从列表中删除
- 没有活跃社区和/或存在持久安全问题的未维护软件可能会从列表中删除
- 问题应该被自动报告: [![](https://github.com/awesome-selfhosted/awesome-selfhosted-data/actions/workflows/check-dead-links.yml/badge.svg)](https://github.com/awesome-selfhosted/awesome-selfhosted-data/issues/1) [![](https://github.com/awesome-selfhosted/awesome-selfhosted-data/actions/workflows/check-unmaintained-projects.yml/badge.svg)](https://github.com/awesome-selfhosted/awesome-selfhosted-data/issues/1)

### 添加软件到列表

- 根据 [.github/ISSUE_TEMPLATES/addition.md](.github/ISSUE_TEMPLATE/addition.md) 中的模板，创建一个新的 [`software/software-name.yml`](https://github.com/awesome-selfhosted/awesome-selfhosted-data/new/master/software) 文件。请使用 [kebab-case](https://en.wikipedia.org/wiki/Letter_case#Kebab_case) 作为文件命名，例如 `my-awesome-software.yml`。
- 删除注释和未使用的可选字段
- 输入描述性的提交消息（例如 `add My Awesome software`）
- 选择 `Create a new branch for this commit and start a pull request`
- 点击 `Propose new file`
- 点击 `Create pull request`

如果您不愿意发送拉取请求，请打开一个新的 [问题](https://github.com/awesome-selfhosted/awesome-selfhosted-data/issues)。

在 [单页模式](https://github.com/r3f/zituoguan) 中，软件将只显示在其 `tags` 列表中的第一个类别下，所以要明智选择。


### 添加标签/分类

标签表示软件的功能类别/特性，并且必须添加到 `tags/tag-name.yml`（使用 [existing tags](https://github.com/r3f/zituoguan-data/blob/master/tags) 作为示例）。任何标签必须至少有 3 个软件项目引用它。[`Miscellaneous`](https://github.com/r3f/zituoguan-data/blob/master/tags/miscellaneous.yml) 标签可用于与任何现有类别不匹配的软件。


```yaml
# 项目名称
name: 项目管理
# 此标签/分类内容的描述（允许使用 markdown）
description: '[项目管理](https://en.wikipedia.org/wiki/Project_management) 是引导团队完成给定约束下的所有项目目标的过程。'
# (可选) 相关标签的名称列表
related_tags:
  - 票务
  - 任务管理与待办事项列表
# (可选) 外部链接
external_links:
  - title: awesome-sysadmin/Code Review
    url: https://github.com/awesome-foss/awesome-sysadmin#code-review
# (可选) 如果设置，将不允许软件项目引用此标签，并且页面将显示一个块，要求访问这些链接
redirect:
  - title: awesome-sysadmin/Continuous Integration & Continuous Deployment
    url: https://github.com/awesome-foss/awesome-sysadmin#continuous-integration--continuous-deployment
```


### 添加许可证

[自由和开源](https://en.wikipedia.org/wiki/Free_and_open-source_software) 软件许可证（最好使用 [SPDX 标识符](https://spdx.org/licenses/) 或自定义许可证）必须添加到 `licenses.yml`（使用 [现有许可证](licenses.yml) 作为示例）：


```yaml
  # 许可证简称
- identifier: ZPL-1.2
  # 完整许可证名称
  name: Zope Public License 1.2
  # 完整许可证文本链接
  url: http://zpl.pub/page/zplv12
```

### 添加语言/平台

用于运行或构建软件的语言/要求/技术应列在 `platforms/platform-name.yml` 中（可以使用[现有平台](platforms/)作为示例）：

```yaml
# 语言/平台名称
name: Java
# 编程语言或部署平台的一般描述（允许使用Markdown）
description: "[Java](https://en.wikipedia.org/wiki/Java_(programming_language)) 是一种高级的、基于类的、面向对象的编程语言，旨在尽可能减少实现依赖关系。"
```


### 从列表中移除软件

只需删除 `software/` 目录下的相应文件并提交 Pull Request。
通过 Github 的网页界面进行操作：
- 使用 [go to file](https://github.com/r3f/zituoguan-data?search=1) 功能打开相应的文件（例如 [`software/redash.yml`](https://github.com/r3f/zituoguan-data/blob/master/software/redash.yml)）
- 点击文件视图右上角的 `...` 按钮，选择 `Delete file`
- 在 `Commit changes` 对话框中，输入 `Remove SOFTWARE_NAME (reason)` 作为您的提交消息，在 `extended description` 字段中提供额外的上下文信息，选择 `Create a new branch for this commit and start a pull request.`，然后点击 `Commit Changes`


### 域名费用

您可以通过各种方式捐赠我们。


### 其他

**重命名标签/类别：** 必须在相应的 `tags/mytag.yml` 文件中将标签重命名。必须在 `tags/*.yml` 和 `software/*.yml` 中更新所有对它的引用。

**自动化任务：**


```bash
$ make help
install             在虚拟环境中安装构建工具
import              从 https://github.com/awesome-selfhosted/awesome-selfhosted 上导入原始列表数据
update_metadata     从项目存储库/API更新元数据
awesome_lint        根据 awesome-selfhosted 指南检查数据
export_markdown     从 YAML 数据中渲染出 Markdown 导出（https://github.com/awesome-selfhosted/awesome-selfhosted）
export_html         从 YAML 数据中渲染出 HTML 导出（https://zituoguan.com）
push_markdown       提交并推送到 Markdown 存储库
push_html           提交并推送到 HTML 网站存储库（修改先前的提交并强制推送）
url_check           检查 URL 是否存在死链或其他连接问题
authors             更新 AUTHORS 文件
clean               清理由自动化任务生成的文件
help                生成带有描述的目标列表
```
