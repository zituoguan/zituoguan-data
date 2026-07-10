# 自托管精选

自托管（Self-hosted）是指在您完全掌控的硬件设备（如个人电脑、树莓派、家庭NAS、Homelab服务器）或云服务器上，运行和维护软件应用程序，而不是依赖第三方云服务商（如 Google、iCloud 或 Notion）。这种方式让您将数据完全掌握在自己手中，同时保障极高的隐私自主权和定制灵活性。

以下是自托管的核心优势和常用方案：

* **数据主权**：个人照片、笔记、密码和代码完全保存在您自己的硬盘上，不受第三方平台审查或隐私泄露风险。
* **成本控制**：虽然初期需要购买硬件或租用云服务器，但长期来看，可以免去按用户/按月支付的高额订阅费，且没有服务商停用的风险。
* **完全定制**：您可以自定义域名、修改源代码、调整数据库结构，并打造专属的工作流。

您可以将许多主流的商业 SaaS 服务替换为完全免费、开源的自托管平替版本：

* 相册备份：[Immich](https://zituoguan.com/software/immich/)（可平替 Google 相册，支持 AI 识别）
* 密码管理：[Vaultwarden](https://zituoguan.com/software/vaultwarden/)（Bitwarden 的轻量级替代方案）
* 代码托管：[Forgejo](https://zituoguan.com/software/forgejo/)（轻量级的纯粹 Git 托管平台）
* 笔记与知识库：[AppFlowy](https://zituoguan.com/software/appflowy/)（开源、隐私优先的 Notion 替代品）
* 文件存储与网盘：[Nextcloud](https://zituoguan.com/software/nextcloud/) 或 [Cloudreve](https://zituoguan.com/software/cloudreve/)（构建个人专属的云端硬盘）

要开始自托管之旅，通常建议使用容器化技术进行部署，这样易于安装和迁移：

* [Docker](https://zituoguan.com/software/docker/)：用于打包和运行应用的标准容器技术。
* [Docker Compose](https://zituoguan.com/software/docker-compose/)：通过编写简单的文本文件来同时启动和管理多个关联应用（如程序本体加数据库）。
* [Nginx Proxy Manager](https://zituoguan.com/software/nginx-proxy-manager/)：直观的图形化反向代理工具，可让您通过自己购买的域名安全访问本地服务。
* Cloudflare Tunnels：Cloudflare 提供的零信任网络隧道，无需公网 IP 和复杂的端口映射，即可将您的自托管服务安全地发布到互联网上。

随着生成式人工智能（GenAI）的爆发，自托管领域也涌现出大量 AI 应用。在自有设备上运行大语言模型（LLM）和 AI 智能体，既能保护数据隐私，又能摆脱对闭源 API 的依赖：

* **本地推理**：[Ollama](https://zituoguan.com/software/ollama/) 一键运行 Llama、DeepSeek、Phi 等开源模型；[Open WebUI](https://zituoguan.com/software/open-webui/) 提供媲美 ChatGPT 的浏览器交互界面。
* **编码助手**：[OpenCode](https://zituoguan.com/software/opencode/) 是终端 AI 编码代理；[Hermes Agent](https://zituoguan.com/software/hermes-agent/) 是可自我进化的 AI 代理，具备持久记忆和技能自动创建能力。
* **个人助手**：[OpenClaw](https://zituoguan.com/software/openclaw/) 是跨平台个人 AI 助手，可通过聊天应用管理邮件和任务。
* **第二大脑**：[Khoj](https://zituoguan.com/software/khoj/) 让你的 AI 记住你的文档和笔记；[Mem0](https://zituoguan.com/software/mem0/) 为 AI 智能体提供持久化记忆层。

无论你是想用本地模型替代 ChatGPT，还是构建自己的 AI 工作流，自托管都为你提供了完全的自由。
