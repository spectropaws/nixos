{ config, pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    nui-nvim
    plenary-nvim
    
    {
      plugin = neo-tree-nvim;
      type = "lua";
      config = ''
        require("neo-tree").setup({
          window = {
            position = "left",
            width = 40,
            mappings = {
              ["<space>"] = "none",
            },
          },
          filesystem = {
            follow_current_file = {
              enabled = true,
            },
            use_libuv_file_watcher = true,
          },
        })
        
        -- White vertical separator line for neo-tree
	vim.api.nvim_create_autocmd("ColorScheme", {
          pattern = "*",
          callback = function()
            vim.api.nvim_set_hl(0, "NeoTreeVertSplit", { fg = "#D0D0D0", bg = "NONE" })
            vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#D0D0D0", bg = "NONE" })
            vim.api.nvim_set_hl(0, "VertSplit", { fg = "#D0D0D0", bg = "NONE" })
            vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#D0D0D0", bg = "NONE" })
          end,
	})

        vim.keymap.set('n', '<leader>e', ':Neotree toggle left<CR>', { desc = "Toggle Neo-tree" })
      '';
    }
  ];
}
