return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  build = ':Copilot auth',
  lazy = false,
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept_word = '<M-w>',
      },
    },
    panel = { enabled = false },
    filetypes = {
      javascript = true,
      typescript = true,
      typescriptreact = true,
      markdown = true,
      help = true,
    },
  },
}
