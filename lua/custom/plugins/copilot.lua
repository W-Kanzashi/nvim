return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  build = ':Copilot auth',
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
