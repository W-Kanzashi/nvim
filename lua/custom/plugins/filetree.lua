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
    vim.keymap.set('n', '<leader>e', ':Neotree reveal <enter>', { desc = 'Open Neotree' })
    vim.keymap.set('n', '<C-n>', ':Neotree toggle <enter>', { desc = 'Toggle Neotree' })

    require('neo-tree').setup {
      open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' }, -- when opening files, do not use windows containing these filetypes or buftypes
      enable_git_status = true,
      enable_diagnostics = true,
      window = {
        width = 40,
        mappings = {
          ['<space>'] = 'none',
          ['Y'] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg('+', path, 'c')
            end,
            desc = 'Copy Path to Clipboard',
          },
          ['y'] = 'copy_to_clipboard',
          ['p'] = 'paste_from_clipboard',
          ['R'] = 'refresh',
        },
      },
      filesystem = {
        filtered_items = {
          always_show = {
            '_components',
            '.env',
          },
        },
        commands = {
          -- over write default 'delete' command to 'trash'.
          delete = function(state)
            if vim.fn.executable 'trash' == 0 then
              vim.api.nvim_echo({
                { '- Trash utility not installed. Make sure to install it first\n', nil },
                { '- In macOS run `brew install trash`\n', nil },
                { '- Or delete the `custom delete command` section in neo-tree', nil },
              }, false, {})
              return
            end
            local inputs = require 'neo-tree.ui.inputs'
            local path = state.tree:get_node().path
            local msg = 'Are you sure you want to trash ' .. path
            inputs.confirm(msg, function(confirmed)
              if not confirmed then
                return
              end

              vim.fn.system { 'trash', vim.fn.fnameescape(path) }
              require('neo-tree.sources.manager').refresh(state.name)
            end)
          end,
          -- Overwrite default 'delete_visual' command to 'trash' x n.
          delete_visual = function(state, selected_nodes)
            if vim.fn.executable 'trash' == 0 then
              vim.api.nvim_echo({
                { '- Trash utility not installed. Make sure to install it first\n', nil },
                { '- In macOS run `brew install trash`\n', nil },
                { '- Or delete the `custom delete command` section in neo-tree', nil },
              }, false, {})
              return
            end
            local inputs = require 'neo-tree.ui.inputs'

            -- Function to get the count of items in a table
            local function GetTableLen(tbl)
              local len = 0
              for _ in pairs(tbl) do
                len = len + 1
              end
              return len
            end

            local count = GetTableLen(selected_nodes)
            local msg = 'Are you sure you want to trash ' .. count .. ' files?'
            inputs.confirm(msg, function(confirmed)
              if not confirmed then
                return
              end
              for _, node in ipairs(selected_nodes) do
                vim.fn.system { 'trash', vim.fn.fnameescape(node.path) }
              end
              require('neo-tree.sources.manager').refresh(state.name)
            end)
          end,
        },
      },
    }
  end,
}
