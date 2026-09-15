FROM debian:bookworm-slim

# 安装最小化系统依赖
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    bash \
    unzip \
    git \
    procps \
    && rm -rf /var/lib/apt/lists/*

# 全局系统路径安装，支持任意非 root 用户（Render、普通用户）直接运行
ENV CXU_NON_INTERACTIVE=true
ENV CXU_HOME="/opt/codex-ultra"
ENV CXU_INSTALL_DIR="/usr/local/bin"

RUN mkdir -p /opt/codex-ultra /usr/local/bin \
    && curl -fsSL https://install.codex-ultra.top/install.sh | bash \
    && chmod -R 777 /opt/codex-ultra || true

ENV PATH="/usr/local/bin:${PATH}"
ENV CODEX_UI_HOST="0.0.0.0"
ENV PORT="43110"

EXPOSE 43110
EXPOSE 10000

# 无论容器以 root 还是任意非 root 账号启动，均可全局执行 cxu 并动态适配 Render $PORT
CMD ["sh", "-c", "exec cxu serve --port ${PORT:-43110}"]
