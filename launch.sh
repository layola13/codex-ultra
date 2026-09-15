#!/usr/bin/env bash
# ==============================================================================
# Codex Ultra (cxu) Codespaces & Cloud Container Launcher
# 
# Usage:
#   bash launch.sh
#   ./launch.sh --port 43110
# ==============================================================================
set -e

# 信任 Render / Codespaces 反向代理并放行公网域名的 WebSocket 连接
export CODEX_UI_TRUST_PROXY="1"
export CODEX_UI_ALLOWED_ORIGINS="*"
export CODEX_UI_HOST="0.0.0.0"
export PORT="${PORT:-43110}"

# 确保全局 PATH 包含常见 bin 目录
export PATH="/usr/local/bin:$HOME/.local/bin:$HOME/.codex-ultra/bin:$PATH"

echo "========================================================"
echo "   🚀 Starting Codex Ultra in Cloud / Codespaces        "
echo "========================================================"
echo "  - Host:           ${CODEX_UI_HOST}"
echo "  - Port:           ${PORT}"
echo "  - Trust Proxy:    ${CODEX_UI_TRUST_PROXY}"
echo "  - Allow Origins:  ${CODEX_UI_ALLOWED_ORIGINS}"
echo "========================================================"

# 1. 检查并自动安装 cxu
if ! command -v cxu >/dev/null 2>&1; then
  echo "==> cxu CLI not found in PATH. Installing via official installer..."
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL https://install.codex-ultra.top/install.sh | bash || true
  elif command -v npm >/dev/null 2>&1; then
    npm install -g @codex-ultra/cxu || true
  fi
fi

# 2. 检查并自动安装 Codex CLI（如果缺失）
if ! command -v codex >/dev/null 2>&1; then
  echo "==> OpenAI Codex CLI not found in PATH. Installing standalone runtime..."
  if command -v curl >/dev/null 2>&1; then
    (curl -fsSL https://chatgpt.com/codex/install.sh | sh) || true
  fi
fi

# 3. 启动 cxu 服务
if command -v cxu >/dev/null 2>&1; then
  echo "==> Launching cxu serve on port ${PORT}..."
  exec cxu serve --port "${PORT}" "$@"
elif [ -f "/opt/codex-ultra/runtime/bun/bin/bun" ] && [ -f "/opt/codex-ultra/server-bundle/index.js" ]; then
  echo "==> Launching bundled runtime on port ${PORT}..."
  exec /opt/codex-ultra/runtime/bun/bin/bun run /opt/codex-ultra/server-bundle/index.js --port "${PORT}" "$@"
else
  echo "ERROR: cxu could not be found or installed. Please check network connectivity." >&2
  exit 1
fi
