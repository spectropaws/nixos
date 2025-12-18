{ config, pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = gitsigns-nvim;
      type = "lua";
      config = ''
        require('gitsigns').setup({
          on_attach = function(bufnr)
            local gitsigns = require('gitsigns')
            
            -- Navigation
            vim.keymap.set('n', ']c', function()
              if vim.wo.diff then
                vim.cmd.normal({']c', bang = true})
              else
                gitsigns.nav_hunk('next')
              end
            end, { buffer = bufnr, desc = "Next hunk" })
            
            vim.keymap.set('n', '[c', function()
              if vim.wo.diff then
                vim.cmd.normal({'[c', bang = true})
              else
                gitsigns.nav_hunk('prev')
              end
            end, { buffer = bufnr, desc = "Previous hunk" })
            
            -- Actions
            vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
            vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
            vim.keymap.set('n', '<leader>hS', gitsigns.stage_buffer, { buffer = bufnr, desc = "Stage buffer" })
            vim.keymap.set('n', '<leader>hu', gitsigns.undo_stage_hunk, { buffer = bufnr, desc = "Undo stage hunk" })
            vim.keymap.set('n', '<leader>hR', gitsigns.reset_buffer, { buffer = bufnr, desc = "Reset buffer" })
            vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
            vim.keymap.set('n', '<leader>hb', function()
              gitsigns.blame_line({ full = true })
            end, { buffer = bufnr, desc = "Blame line" })
            vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame, { buffer = bufnr, desc = "Toggle blame" })
            vim.keymap.set('n', '<leader>hd', gitsigns.diffthis, { buffer = bufnr, desc = "Diff this" })
          end
        })
      '';
    }
  ];
}
