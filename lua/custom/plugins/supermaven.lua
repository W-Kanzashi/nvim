return {
  'supermaven-inc/supermaven-nvim',
  config = function()
    require('supermaven-nvim').setup {
      keymaps = {
        accept_suggestion = '<M-l>',
        accept_word = '<M-j>',
      },
    }
  end,
}
