# codex-ultra 第三方开源组件及许可证声明 (Third-Party Open-Source Components & Licenses)

**codex-ultra** 在开发过程中使用了以下优秀的开源第三方依赖库与框架。谨在此向所有开源贡献者致以崇高的敬意：

**中文版** | [English](THIRD_PARTY_LICENSES_EN.md)

---

## 🌱 开源参考项目 (Open-Source Reference Projects)

| 项目 | 许可证 | 参考内容 |
| :--- | :--- | :--- |
| **[Cherry Studio](https://github.com/CherryHQ/cherry-studio)** | AGPL-3.0 | 参考其消息分组结构共享、长会话虚拟列表、滚动所有权管理，以及 Electron 桌面端托盘与打包设计。 |

> Cherry Studio 是架构与交互设计参考项目，不作为本项目的运行时依赖；相关实现由本项目独立适配。

---

## 🎨 前端与 UI 框架 (Frontend & UI Frameworks)

| 依赖库名称 (Library Name) | 版本 (Version) | 许可证 (License) | 用途描述 (Description) |
| :--- | :--- | :--- | :--- |
| **React / React-DOM** | `^19.2.0` | MIT | 核心 UI 渲染框架与 DOM 交互引擎 |
| **@mui/material** | `^7.3.5` | MIT | Material Design UI 组件库 |
| **@mui/icons-material** | `^7.3.5` | MIT | Material Design 图标库 |
| **@emotion/react & styled** | `^11.14.0` | MIT | CSS-in-JS 动态样式引擎 |
| **@monaco-editor/react** | `^4.7.0` | MIT | 嵌入式 Monaco 代码编辑器 |
| **monaco-editor** | `^0.55.1` | MIT | 微软开源的专业代码编辑器引擎 |
| **@git-diff-view/react & file**| `^0.1.7` | MIT | Git 代码差异比较与可视化渲染组件 |
| **@tanstack/react-virtual** | `^3.14.6` | MIT | 虚拟化长列表与会话瀑布流渲染引擎 |
| **react-resizable-panels** | `^4.12.2` | MIT | 可拖拽调整大小的响应式工作台面板 |
| **marked** | `^18.0.6` | MIT | 极速 Markdown 文本解析与渲染引擎 |
| **three** | `^0.185.1` | MIT | 3D Canvas / 背景特效渲染引擎 |

---

## ⚙️ 后端服务与运行时 (Backend & Runtime Dependencies)

| 依赖库名称 (Library Name) | 版本 (Version) | 许可证 (License) | 用途描述 (Description) |
| :--- | :--- | :--- | :--- |
| **Bun** | `^1.3.14` | MIT | 极速 JavaScript/TypeScript 运行时及 HTTP/WS 服务端 |
| **ws** | `^8.21.1` | MIT | 高性能 WebSocket 服务端与客户端通信库 |
| **postgres** | `^3.4.7` | MIT | PostgreSQL 数据库驱动客户端 |
| **@napi-rs/keyring** | `^1.3.0` | MIT | 系统级安全凭证与密钥存储 Native 绑定 |
| **TypeScript** | `^5.9.3` | Apache-2.0 | 静态类型检查与代码构建工具链 |
| **@playwright/test** | `^1.61.1` | Apache-2.0 | 端到端 (E2E) 自动化测试框架 |

---

## 📜 开源许可证声明 (License Notices)

所有的第三方开源组件均根据各自的开源许可协议（如 MIT、Apache-2.0）合法使用与集成。各自版权归属于对应的原作者或开源社区项目维护团队。
