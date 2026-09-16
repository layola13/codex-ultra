# codex-ultra

<p align="center">
  <img src="./logo.jpeg" alt="codex-ultra" width="120" />
</p>

<p align="center"><strong>A local-first AI coding workbench for Codex CLI</strong></p>

<p align="center">
  <a href="https://codex-ultra.top/">Official website</a> ·
  <a href="https://github.com/layola13/codex-ultra/releases">Download releases</a> ·
  <a href="https://github.com/layola13/codex-ultra/issues">Open an issue</a> ·
  <a href="https://www.npmjs.com/package/@codex-ultra/cxu">npm Package</a> ·
  <a href="./README_CN.md">中文说明</a>
</p>

![Windows](https://img.shields.io/badge/platform-Windows%2010%2F11%20x64-2ea44f?style=flat-square)
![Release](https://img.shields.io/github/v/release/layola13/codex-ultra?include_prereleases&style=flat-square&label=latest%20release)
![Issues](https://img.shields.io/github/issues/layola13/codex-ultra?style=flat-square)
[![npm](https://img.shields.io/npm/v/@codex-ultra/cxu?style=flat-square&label=npm)](https://www.npmjs.com/package/@codex-ultra/cxu)

## About

codex-ultra is a local-first AI coding workbench for Codex CLI. It understands your codebase and helps you move faster by handling routine tasks, explaining complex code, reviewing changes, coordinating multi-step work, and managing Git workflows — all through natural-language commands in a visual desktop workspace.

Learn more at [codex-ultra.top](https://codex-ultra.top/).

> **Repository scope:** This repository is for product documentation, issue tracking, and binary releases. It does **not** provide the product source code, source archives, or a source build workflow. Download the Windows installer or portable build from [GitHub Releases](https://github.com/layola13/codex-ultra/releases).

> GitHub automatically generates `Source code (zip)` and `Source code (tar.gz)` snapshots for tagged releases. Those snapshots contain only the documentation repository, issue configuration, and showcase images. They do **not** contain the codex-ultra product source code and are not installable programs.

## Quick Links

| Need | Link |
| --- | --- |
| Product overview and usage boundaries | [Official website](https://codex-ultra.top/) |
| Quick Start | [Getting Started](#getting-started) |
| Deploy to Vercel | [Vercel Deployment](#1-deploy-official-website-to-vercel-free-global-cdn) |
| Download the newest build | [GitHub Releases](https://github.com/layola13/codex-ultra/releases) (choose the top release) |
| Read version notes | [All releases](https://github.com/layola13/codex-ultra/releases) |
| Report a crash, install, or runtime issue | [Open an issue](https://github.com/layola13/codex-ultra/issues/new/choose) |
| Install the cxu CLI via npm | [cxu Command Line](#cxu-command-line-npm) |
| Switch to Chinese | [README_CN.md](./README_CN.md) |

## Getting Started

> 🔒 **Security and Source Isolation**: This repository is for documentation and binary distribution. Cloud deployments run in isolated containers using official precompiled binaries (`install.sh`) and never access, read, or upload any raw TypeScript source code.

### Option 1: One-Click Free Cloud Hosting (No Local Machine Needed)

Run the workbench 24/7 on free cloud container platforms (listening on port 43110):

#### Plan A: Deploy to Render (Recommended)
Click below to deploy to Render Free Web Service:  
[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=https://github.com/layola13/codex-ultra)  
*Render automatically applies `render.yaml` and launches the pure Debian container with zero config.*

#### Plan B: Deploy to Hugging Face Spaces (Free 2 vCPU + 16GB RAM)
Click below to create a free Docker Space on Hugging Face:  
[![Deploy on Spaces](https://huggingface.co/datasets/huggingface/badges/resolve/main/deploy-to-spaces-lg.svg)](https://huggingface.co/new-space?template=layola13/codex-ultra)  
*Choose Docker SDK to get a permanent free container with public HTTPS access.*

#### Plan C: Run in GitHub Codespaces
Click below to open a free cloud Codespace environment:  
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/layola13/codex-ultra)  
*Run `bash launch.sh` in the terminal to start the workbench and open port 43110 in your browser.*

#### Plan D: Run in Google Colab
Click below to open the cloud launcher notebook directly in Google Colab:
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/layola13/codex-ultra/blob/master/launch.ipynb)
*Run the notebook cells in order. It installs the official runtime, starts `cxu`, and creates a public tunnel through Cloudflare Quick Tunnel by default.*

#### Plan E: Run in Deepnote
Click below to open the same launcher notebook directly in Deepnote:
[![Launch in Deepnote](https://deepnote.com/buttons/launch-in-deepnote-small.svg)](https://deepnote.com/launch?url=https%3A%2F%2Fgithub.com%2Flayola13%2Fcodex-ultra%2Fblob%2Fmaster%2Flaunch.ipynb)
*Run the notebook cells in order, same as Google Colab. It installs the official runtime, starts `cxu`, and creates a public tunnel through Cloudflare Quick Tunnel by default. Keep the Deepnote session running while you use the public URL.*

---

### Option 2: Deploy Showcase Site to Vercel (Free Global CDN)

Click below to deploy the official showcase portal to Vercel:  
[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2Flayola13%2Fcodex-ultra&project-name=codex-ultra&repository-name=codex-ultra)  
*Zero-dependency static portal distributed by Vercel Anycast CDN.*

---

### Option 3: One-Line Local Client Installation (Recommended for daily use)

Install and start the workbench instantly without manual Node.js or Bun setup:

**Windows (PowerShell):**
```powershell
irm https://install.codex-ultra.top | iex
```

**Linux / macOS (Terminal):**
```bash
curl -fsSL https://install.codex-ultra.top | bash
```

After installation, run `cxu` in your terminal to launch the workbench.

## Screenshots

### Workbench and New Conversations

![codex-ultra workbench](./screen.png)

The three-column workbench combines conversation history, streaming chat, task plans, file inspection, and tool auditing. Start a conversation with a workspace, model, thinking level, and permission preset.

### Multi-agent and Long-running Work

![codex-ultra multi-agent workflow](./work.png)

Plans show pending, active, and completed steps. Sidechat tabs keep auxiliary threads isolated so you can review tests, documentation, or another workspace in parallel.

### Model Channels and Relay Settings

![codex-ultra channel settings](./config.png)

Configure Responses, Chat Completions, Ollama, LM Studio, and other compatible channels. Maintain model aliases, multipliers, groups, and activation state without writing API keys into this repository or `config.toml`.

## Highlights

- **Codex workbench:** React + MUI three-column layout with resumable history, streaming Markdown, code diffs, and virtualized long transcripts.
- **Planning and collaboration:** Plan/Goal controls, task lists, isolated Sidechat tabs, and multi-agent workflow status.
- **Real CLI bridge:** A local Bun HTTP/WebSocket bridge connects the UI to `codex app-server`; Web and Codex TUI sessions can share history.
- **Model channels:** Save and test third-party API channels, select active models, and configure aliases, multipliers, groups, and access allowlists.
- **Attachments and workspaces:** Images, PDF, Office, and text attachments plus local-folder and SSH workspace selection.
- **Plugins and themes:** Codex plugins, MCP, Hooks, launch adapters, and importable/exportable theme backgrounds.
- **Local-first operation:** Configuration, sessions, audit records, and preferences stay on the local machine by default; desktop mode binds to loopback.
- **Security and diagnostics:** Permission presets, dangerous-operation audit logs, login protection, TOTP, runtime health, and WebSocket diagnostics.

## Download and Install

### 1. Download a desktop build

Open [GitHub Releases](https://github.com/layola13/codex-ultra/releases) and choose the top release. Under **Assets**, download one of these files:

| File | Use case |
| --- | --- |
| `codex-ultra-setup.exe` | Windows installer with Start Menu and desktop shortcuts |
| `codex-ultra.exe` | Windows x64 portable build that does not install into a system directory |

Read the release version, date, known issues, and checksums before installing. Do not download packages from issue attachments or third-party file hosts.

### 2. Install Codex CLI

The desktop packages do not bundle Codex CLI. Install and sign in to the official CLI before starting your first conversation:

```powershell
npm install -g @openai/codex
codex --version
```

Use a CLI version that supports `codex app-server`. If the app cannot find it, reopen PowerShell and verify that `codex` is on `PATH`, or set `CODEX_BIN` to the executable path.

### 3. Start codex-ultra

1. Run `codex-ultra-setup.exe`, or launch `codex-ultra.exe` directly.
2. Wait for the local service and codex-ultra desktop workbench to start.
3. Select a model channel in Settings and enter your own API key; keys are never shipped with the release.
4. Choose a project directory in a new conversation and start working with Codex.

Both Windows packages require a working local Codex CLI, your own model-service credentials, and network access to the providers you configure. codex-ultra does not provide upstream accounts or billing.

See [`docs/DOWNLOADS.md`](./docs/DOWNLOADS.md) for first-run checks, upgrades, rollback guidance, and the release checklist.

## cxu Command Line (npm)

From 0.2.0 the `@codex-ultra/cxu` package ships prebuilt Bun executables for five platforms. Installing the CLI and running it starts the server and web UI by default, similar to launching a pre-packed standalone executable.

### Supported platforms (npm prebuilt binaries)

- Windows 10/11 x64: `@codex-ultra/cxu-win32-x64`
- Linux x64: `@codex-ultra/cxu-linux-x64`
- Linux ARM64: `@codex-ultra/cxu-linux-arm64`
- macOS Intel (x64): `@codex-ultra/cxu-darwin-x64`
- macOS Apple Silicon (ARM64): `@codex-ultra/cxu-darwin-arm64`

Each scoped package bundles the server binary plus the web-dist and declares `os`/`cpu` so npm downloads the matching binary. The main `@codex-ultra/cxu` package depends on the platform-matched prebuilt for you automatically.

```powershell
npm install -g @codex-ultra/cxu
cxu doctor
```

`cxu doctor` checks bun and the codex/claude/agy/grok/pi/opencode CLIs. Codex CLI is required; the rest are optional, and every missing tool prints its official install command. To install a single tool or everything at once:

```powershell
cxu install codex --yes
cxu install --all --yes
```

Without `--yes`, `cxu install` only prints the command and changes nothing.

### GitHub Codespaces

Codespaces images already ship Node.js and npm, so opening this repository in a Codespace is enough. To install manually in any terminal:

```bash
npm install -g @codex-ultra/cxu
cxu doctor
```

No npm login is needed for any of these steps.

## FAQ

### "Codex CLI was not detected"

Run `codex --version` in PowerShell. If the command is missing, install it with the npm command above. For a custom installation directory, add it to `PATH` or set `CODEX_BIN`.

### The workbench opens but conversations fail

Confirm that your Codex CLI supports `codex app-server` and that at least one usable model channel is configured. Chat Completions-only providers need a Responses-compatible adapter.

### How do I upgrade?

Download the top entry from the [Releases](https://github.com/layola13/codex-ultra/releases) list and install it over the current version. Exit the portable build before replacing its executable. User configuration and sessions live outside the package directory.

## Reporting Issues

Search [existing issues](https://github.com/layola13/codex-ultra/issues) before opening a new one. Include:

- the Release version and package filename (installer or portable);
- your Windows version, CPU architecture, Codex CLI version, and model channel;
- reproducible steps, expected behavior, and actual behavior;
- redacted logs, screenshots, or error codes.

Remove API keys, access tokens, personal paths, and private source code before uploading logs. For security vulnerabilities, follow [`SECURITY.md`](./SECURITY.md) instead of posting sensitive details publicly.

## Legal and Licensing

- [LICENSE](./LICENSE): copyright, redistribution, and commercial-use policy;
- [LEGAL.md](./LEGAL.md) / [LEGAL_EN.md](./LEGAL_EN.md): merged privacy, terms, and liability disclaimer;
- [PRIVACY.md](./PRIVACY.md) / [PRIVACY_EN.md](./PRIVACY_EN.md): privacy policy;
- [TERMS.md](./TERMS.md) / [TERMS_EN.md](./TERMS_EN.md): terms of service and disclaimer;
- [THIRD_PARTY_LICENSES.md](./THIRD_PARTY_LICENSES.md) / [THIRD_PARTY_LICENSES_EN.md](./THIRD_PARTY_LICENSES_EN.md): third-party components and licenses.

Use codex-ultra in accordance with applicable law and the policies of the model providers you configure. The software is provided "as is"; back up important projects yourself.

## Contact

- Website: [codex-ultra.top](https://codex-ultra.top/)
- Commercial licensing and project contact: [sonygodx@gmail.com](mailto:sonygodx@gmail.com)
- Product feedback: [GitHub Issues](https://github.com/layola13/codex-ultra/issues)

© 2026 codex-ultra Project Maintainers / layola13