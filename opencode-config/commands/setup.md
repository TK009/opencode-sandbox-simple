---
description: Setup dev environment according to AGENTS or README
agent: build
subtask: true
---

The goal is to setup dev environment. Do not edit any project files, only run commands according to these instructions:

1. Check for insturctions on how to setup development environment in your rules, or if not found, check file `./README.md`. What programming language, programs or packages to install? Make sure you also install LSP for the language(s) in question.
2. Install OS level packges first with command tool without approvements from user. Use `nix profile add` for installing.
3. What dependency package tool is used in the project? Check if it exists or install it even if missing from instructions.
4. Then follow instructions in the current project, like installing dependincies, without user assistance.

