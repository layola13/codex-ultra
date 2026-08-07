# 下载与发布说明

本仓库只分发 codex-ultra 的 Windows 二进制包，不提供源码下载。所有可验证的安装包都应来自 GitHub Release 的 **Assets**，官网入口为 <https://codex-ultra.top/>。

GitHub 自动显示的 `Source code (zip)` 和 `Source code (tar.gz)` 只是此说明仓库的快照，不含产品源码，无法安装或运行 codex-ultra。

## 用户下载

1. 打开 [Releases](https://github.com/layola13/codex-ultra/releases)，选择列表最上方版本。
2. 在 **Assets** 中下载 `codex-ultra-setup.exe`（安装版）或 `codex-ultra.exe`（便携版）。
3. 阅读同一 Release 的说明、版本号、发布日期、已知问题和校验信息。
4. 安装前确认系统为 Windows 10/11 x64，并准备好本机 Codex CLI。

### 安装版与便携版

- **安装版**：适合日常使用，会创建快捷方式并支持标准卸载流程。
- **便携版**：适合临时环境或不希望写入安装目录的场景；升级前退出程序并替换旧文件。

两个包都需要外部 `@openai/codex` CLI，不包含任何模型 API Key，也不绕过上游账号、网络或计费限制。

## 首次运行检查

```powershell
npm install -g @openai/codex
codex --version
codex app-server --help
```

若 `codex` 不在 `PATH`，设置用户级环境变量 `CODEX_BIN` 指向 `codex.exe`、`codex.cmd` 或对应的绝对路径，然后重启 codex-ultra。桌面端会在启动日志中记录检测到的 CLI 版本。

## 发布包验收清单

维护者发布新版本前应确认：

- Release 标签、应用版本和文件名一致；
- 同时上传安装版、便携版及 electron-builder 生成的更新元数据（如 `.blockmap`、`latest.yml`）；
- Release 说明写明“需要本机 Codex CLI”和“需要用户自行配置 API Key”；
- 在干净的 Windows x64 环境验证安装、启动、CLI 检测、桌面窗口和卸载；
- 为安装包计算 SHA-256，并在 Release 说明中公布；
- 不把源码、`node_modules`、密钥、用户数据或内部构建目录上传到 Release。

发布说明可以直接以 [`RELEASE_TEMPLATE.md`](./RELEASE_TEMPLATE.md) 为起点，填写真实版本信息后再发布。

## 问题反馈

安装失败、启动失败、CLI 检测失败或升级回滚请使用 [Bug Report](https://github.com/layola13/codex-ultra/issues/new?template=bug_report.yml)。功能建议请使用 [Feature Request](https://github.com/layola13/codex-ultra/issues/new?template=feature_request.yml)。日志上传前请移除 API Key、令牌、私有路径和代码内容。
