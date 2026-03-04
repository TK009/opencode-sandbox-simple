import type { Plugin } from "@opencode-ai/plugin"

export const TerminalBell: Plugin = async () => {
  return {
    event: async ({ event }) => {
      if (event.type === "session.idle") {
        await Bun.write(Bun.stdout, "\x07")
      }
    },
  }
}
