-- File: lua/custom/plugins/filetree.lua

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    vim.keymap.set('n', '\\', ':Neotree reveal <CR>', { desc = 'Open Neotree' })

    require('neo-tree').setup {
      open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' }, -- when opening files, do not use windows containing these filetypes or buftypes
      enable_git_status = true,
      enable_diagnostics = true,
      window = {
        width = 40,
        filtered_items = {
          always_show = {
            '_components',
            '_types',
            '.env',
          },
        },
        mappings = {
          ['<space>'] = 'none',
          ['C'] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg('+', path, 'c')
            end,
            desc = 'Copy Path to Clipboard',
          },
          ['c'] = 'copy_to_clipboard',
          ['p'] = 'paste_from_clipboard',
          ['R'] = 'refresh',
          ['\\'] = 'close_window',
        },
      },
      filesystem = {
        filtered_items = {
          always_show = {
            '_components',
            '_types',
            '.env',
          },
        },
      },
    }
  end,
}
