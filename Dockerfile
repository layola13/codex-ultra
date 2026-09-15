FROM debian:bookworm-slim

# 安装必要基础工具与 Node.js 运行时
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    bash \
    unzip \
    git \
    procps \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

# 全局系统路径安装，支持任意普通账号执行
ENV CXU_NON_INTERACTIVE=true
ENV CXU_HOME="/opt/codex-ultra"
ENV CXU_INSTALL_DIR="/usr/local/bin"

RUN mkdir -p /opt/codex-ultra /usr/local/bin \
    && curl -fsSL https://install.codex-ultra.top/install.sh | bash \
    && chmod -R 777 /opt/codex-ultra || true \
    && (ln -sf /opt/codex-ultra/runtime/bun/bin/bun /usr/local/bin/bun || true)

ENV PATH="/usr/local/bin:${PATH}"
ENV CODEX_UI_HOST="0.0.0.0"
ENV PORT="43110"

EXPOSE 43110
EXPOSE 10000

# 无论以 root 还是任意非 root 账号启动，均可全局执行 cxu 并动态绑定 Render $PORT
CMD ["sh", "-c", "exec cxu serve --port ${PORT:-43110}"]
