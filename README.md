# OpenCode Sandbox (Simple)

Containerized OpenCode coding agent with security hardening.

## Prerequisites

- Docker and Docker Compose v2

## Setup

Set preferred git identity in Dockerfile

```bash
cp .env.example .env
# Edit .env and add your GitHub token (optional, enables gh CLI auth)
```

Other:
* Enable context cleaning in opencode config (ocp plugin) if you want to experiment with it.
* Disable terminal bell on ready by removing it from plugin directory.
* Recommended: For clipboard to work, you might need `autocutsel -selection PRIMARY -selection CLIPBOARD` or similar clipboard helper, depending on terminal etc. Tmux might also help with correct settings. 

## Build

```bash
docker compose build
```

## Run

```bash
HOST_DIR=/path/to/project docker compose run --rm opencode
```

`HOST_DIR` — absolute path to the project directory on the host (mounted at the same path inside the container).

### Debug

```bash
HOST_DIR=/path/to/project docker compose run --rm opencode bash
```


## Environment variables

| Variable | Required | Description |
|---|---|---|
| `HOST_DIR` | yes | Absolute path to project on the host |
| `GH_TOKEN` | no | GitHub token for `gh` CLI authentication |
