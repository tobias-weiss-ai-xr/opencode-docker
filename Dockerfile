FROM alpine:3.19

# Install dependencies including terminal and timezone support
# tzdata is CRITICAL for bubbletea-based TUI apps (opencode) to work
RUN apk add --no-cache \
    curl \
    ca-certificates \
    git \
    openssh-client \
    bash \
    jq \
    sudo \
    shadow \
    ncurses \
    ncurses-terminfo \
    tzdata \
    locales

# Set up locale and timezone (critical for TUI apps)
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TZ=UTC

# Create non-root user with configurable UID
ARG USER_ID=1001
RUN adduser -u $USER_ID -D -s /bin/bash op \
    && echo "op ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/op \
    && chmod 0440 /etc/sudoers.d/op

USER op
WORKDIR /home/op
ENV HOME=/home/op

# Install OpenCode
RUN curl -fsSL https://opencode.ai/install | bash

# Add OpenCode to PATH
ENV PATH=/home/op/.opencode/bin:$PATH

# Set working directory
WORKDIR /workspace

# Default command
CMD ["opencode"]
