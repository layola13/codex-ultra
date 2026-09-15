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

# 从官方发布镜像一键安装预编译二进制（绝不包含任何 TS 源码）
ENV CXU_NON_INTERACTIVE=true
RUN curl -fsSL https://install.codex-ultra.top/install.sh | bash

ENV PATH="/root/.codex-ultra/bin:${PATH}"
ENV CODEX_UI_HOST="0.0.0.0"
ENV CODEX_UI_PORT="43110"

EXPOSE 43110

# 启动工作台
CMD ["/root/.codex-ultra/bin/cxu", "serve", "--port", "43110"]
