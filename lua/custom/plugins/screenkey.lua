return {
  'NStefan002/screenkey.nvim',
  cmd = 'Screenkey',
  version = '*',
  lazy = true,
  config = {
    -- Run Screenkey on Neovim startup if it is installed
    vim.api.nvim_create_autocmd({ 'VimEnter' }, {
      desc = 'Auto run Screenkey on VimEnter',
      callback = function()
        vim.cmd 'Screenkey'
      end,
    }),
  },
}
