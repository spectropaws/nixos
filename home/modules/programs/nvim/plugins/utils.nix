{ config, pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # Which Key
    {
      plugin = which-key-nvim;
      type = "lua";
      config = ''
        require("which-key").setup({})
        require("which-key").add({
          { "<leader>?", desc = "Buffer Local Keymaps (which-key)" },
        })
      '';
    }

    # Gitsigns
    {
      plugin = gitsigns-nvim;
      type = "lua";
      config = ''
        require('gitsigns').setup{
          on_attach = function(bufnr)
            local gitsigns = require('gitsigns')
            -- (Add your detailed gitsigns keymaps here inside this string)
            vim.keymap.set('n', ']c', function()
              if vim.wo.diff then vim.cmd.normal({']c', bang=true}) else gitsigns.nav_hunk('next') end
            end)
            vim.keymap.set('n', '[c', function()
              if vim.wo.diff then vim.cmd.normal({'[c', bang=true}) else gitsigns.nav_hunk('prev') end
            end)
            vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk)
            vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk)
            vim.keymap.set('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
          end
        }
      '';
    }

    # Telescope
    telescope-ui-select-nvim
    {
      plugin = telescope-nvim;
      type = "lua";
      config = ''
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<C-p>', builtin.find_files, {})
        vim.keymap.set('n', '<leader><leader>', builtin.live_grep, {})
        
        require("telescope").setup {
          extensions = { ["ui-select"] = { require("telescope.themes").get_dropdown {} } }
        }
        require("telescope").load_extension("ui-select")
      '';
    }
  ];
}
