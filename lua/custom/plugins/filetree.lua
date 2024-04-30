-- File: lua/custom/plugins/filetree.lua

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    vim.keymap.set('n', '<leader>e', ':Neotree reveal <enter>', { desc = 'Open Neotree' })
    vim.keymap.set('n', '<C-n>', ':Neotree toggle <enter>', { desc = 'Toggle Neotree' })

    require('neo-tree').setup {
      enable_git_status = true,
      enable_diagnostics = true,
      window = {
        width = 40,
      },
      filesystem = {
        filtered_items = {
          always_show = {
            '_components',
            '.env',
          },
        },
      },
    }
  end,
}
