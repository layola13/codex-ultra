FROM debian:bookworm-slim

# 安装必要基础工具、Node.js 与 npm 运行时
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    bash \
    unzip \
    git \
    procps \
    tar \
    gzip \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# 全局系统路径安装 cxu 与官方 Standalone Codex CLI
ENV CXU_NON_INTERACTIVE=true
ENV CXU_HOME="/opt/codex-ultra"
ENV CXU_INSTALL_DIR="/usr/local/bin"
ENV CODEX_NON_INTERACTIVE=true
ENV CODEX_HOME="/opt/codex-ultra/.codex"
ENV CODEX_INSTALL_DIR="/usr/local/bin"
ENV CODEX_UI_LEGAL_DIR="/opt/codex-ultra"

RUN mkdir -p /opt/codex-ultra /usr/local/bin /opt/codex-ultra/.codex \
    && curl -fsSL https://install.codex-ultra.top/install.sh | bash \
    && (curl -fsSL https://chatgpt.com/codex/install.sh | sh) || true \
    && (npm install -g @openai/codex || true) \
    && (ln -sf /opt/codex-ultra/runtime/bun/bin/bun /usr/local/bin/bun || true) \
    && (mkdir -p /root/.codex/packages/standalone && ln -sf /opt/codex-ultra/.codex/packages/standalone/current /root/.codex/packages/standalone/current 2>/dev/null || true) \
    && (if [ -f /opt/codex-ultra/.codex/packages/standalone/current/bin/codex ]; then ln -sf /opt/codex-ultra/.codex/packages/standalone/current/bin/codex /usr/local/bin/codex; fi)

# 复制隐私政策与法律合规协议文档至运行环境
COPY PRIVACY.md PRIVACY_EN.md TERMS.md TERMS_EN.md LICENSE THIRD_PARTY_LICENSES.md THIRD_PARTY_LICENSES_EN.md LEGAL.md LEGAL_EN.md /opt/codex-ultra/

RUN chmod -R 777 /opt/codex-ultra /root/.codex 2>/dev/null || true

ENV PATH="/usr/local/bin:${PATH}"
ENV CODEX_UI_HOST="0.0.0.0"
ENV CODEX_UI_TRUST_PROXY="1"
ENV CODEX_UI_ALLOWED_ORIGINS="*"
ENV CODEX_HOME="/opt/codex-ultra/.codex"
ENV CODEX_UI_LEGAL_DIR="/opt/codex-ultra"
ENV PORT="43110"

EXPOSE 43110
EXPOSE 10000

# 启动工作台
CMD ["sh", "-c", "exec cxu serve --port ${PORT:-43110}"]
