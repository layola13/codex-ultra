FROM debian:bookworm-slim

# 安装最小化系统运行时依赖
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    bash \
    unzip \
    git \
    procps \
    && rm -rf /var/lib/apt/lists/*

# 从官方发布镜像一键安装预编译二进制（零 TS 源码，安全隔离）
ENV CXU_NON_INTERACTIVE=true
RUN curl -fsSL https://install.codex-ultra.top/install.sh | bash

ENV PATH="/root/.codex-ultra/bin:${PATH}"
ENV CODEX_UI_HOST="0.0.0.0"

# 默认端口，Render 会自动注入 PORT 环境变量（如 10000）覆盖此值
ENV PORT="43110"
EXPOSE 43110
EXPOSE 10000

# 动态绑定 Render 的 $PORT 端口，无 $PORT 时默认使用 43110
CMD ["sh", "-c", "exec /root/.codex-ultra/bin/cxu serve --port ${PORT:-43110}"]
