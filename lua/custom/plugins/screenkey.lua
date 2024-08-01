return {
  'NStefan002/screenkey.nvim',
  version = '*',
  event = 'VimEnter',

  -- Screenkey
  vim.keymap.set('n', '<leader>ss', ':Screenkey<CR>', { desc = '[S]creen [S]key' }),
}
