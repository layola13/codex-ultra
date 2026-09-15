FROM debian:bookworm-slim

# 安装必要基础工具、Node.js 与 npm 运行时
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    bash \
    unzip \
    git \
    procps \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# 全局系统路径安装 cxu 与 @openai/codex CLI（预装就绪）
ENV CXU_NON_INTERACTIVE=true
ENV CXU_HOME="/opt/codex-ultra"
ENV CXU_INSTALL_DIR="/usr/local/bin"

RUN mkdir -p /opt/codex-ultra /usr/local/bin \
    && curl -fsSL https://install.codex-ultra.top/install.sh | bash \
    && chmod -R 777 /opt/codex-ultra || true \
    && (ln -sf /opt/codex-ultra/runtime/bun/bin/bun /usr/local/bin/bun || true) \
    && npm install -g @openai/codex || true

ENV PATH="/usr/local/bin:${PATH}"
ENV CODEX_UI_HOST="0.0.0.0"
ENV PORT="43110"

EXPOSE 43110
EXPOSE 10000

# 启动工作台
CMD ["sh", "-c", "exec cxu serve --port ${PORT:-43110}"]
