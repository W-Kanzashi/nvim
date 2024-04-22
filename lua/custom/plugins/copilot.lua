return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  build = ':Copilot auth',
  lazy = false,
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
    filetypes = {
      javascript = true,
      typescript = true,
      markdown = true,
      help = true,
    },
  },
}
