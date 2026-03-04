# Environment
You are working in a Alpine linux distro container where you can install any needed packages.

## If missing an executable, "command not found"

Install with `sudo apk add` and continue your previous task.

Ask user only if some needed resources cannot be obtained with commands or environment seems broken.

## Python pip packages

Use `uv`, it is faster than `pip`.
Use `uv add` instead of `uv pip install` for project dependencies, and `uv add --dev` for dependencies only needed for testing and CI.
Use `uv run` for running current project applications, or `uvx` for running generic tools.
