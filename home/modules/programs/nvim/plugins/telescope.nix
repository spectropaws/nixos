{ config, pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    telescope-ui-select-nvim
    
    {
      plugin = telescope-nvim;
      type = "lua";
      config = ''
        local builtin = require("telescope.builtin")
        
        -- Keymaps
        vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = "Find files" })
        vim.keymap.set('n', '<leader><leader>', builtin.live_grep, { desc = "Live grep" })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffers" })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })
        
        -- Setup
        require("telescope").setup({
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown({})
            }
          }
        })
        
        require("telescope").load_extension("ui-select")
      '';
    }
  ];
}
