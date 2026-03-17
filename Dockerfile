FROM ghcr.io/anomalyco/opencode:latest

# System packages
RUN apk add --no-cache \
    curl git bash ca-certificates sudo unzip jq ripgrep \
    gcc make build-base pkgconfig openssl-dev \
    python3 nodejs yarn typescript npm uv github-cli vim ncurses

# Non-root user with sudo restricted to apk
RUN addgroup -g 1000 agent \
    && adduser -u 1000 -G agent -s /bin/bash -D agent \
    && adduser agent wheel \
    && echo '%wheel ALL=(ALL) NOPASSWD: /sbin/apk' > /etc/sudoers.d/agent

# Browser automation
RUN npm install -g @playwright/cli

USER agent
WORKDIR /home/agent
ENV PATH="/home/agent/.local/bin:$PATH"

# Python LSP
RUN uv tool install pyright

# Anonymized git identity
RUN git config --global user.name "Agent User" \
    && git config --global user.email "agent@sandbox.local"

ENV EDITOR=vim

# Inline entrypoint: authenticate gh if token provided, then exec command
ENTRYPOINT ["/bin/bash", "-c", \
    "if [ -n \"$GH_TOKEN\" ]; then echo \"$GH_TOKEN\" | env -u GH_TOKEN gh auth login --with-token 2>/dev/null; gh auth setup-git 2>/dev/null; fi && exec \"$@\"", \
    "--"]
CMD ["opencode"]
