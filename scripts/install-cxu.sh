#!/usr/bin/env bash
# codex-ultra cxu one-step installer.
# Works anywhere with Node.js 18+ and npm: GitHub Codespaces, Linux, macOS, WSL, Windows Git-Bash.
# Usage:
#   bash scripts/install-cxu.sh
set -euo pipefail

if ! command -v npm >/dev/null 2>&1; then
  echo "npm not found. Install Node.js 18+ first: https://nodejs.org/" >&2
  exit 1
fi

echo "Installing @codex-ultra/cxu ..."
npm install -g @codex-ultra/cxu

# doctor exits non-zero when the required Codex CLI is missing;
# keep going so the next-step hints below are always printed.
cxu doctor || true

echo ""
echo "Next steps:"
echo "  - Missing tools print their official install commands above."
echo "  - Install Codex CLI (required):  cxu install codex --yes"
echo "  - Install everything missing:    cxu install --all --yes"
