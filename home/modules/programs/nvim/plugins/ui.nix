{ config, pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    nvim-web-devicons
    nui-nvim
    plenary-nvim

    # Colorschemes
    {
      plugin = tokyonight-nvim;
      type = "lua";
      config = ''
        require("tokyonight").setup({
            transparent = true,
            styles = { sidebars = "transparent", floats = "transparent" },
        })
      '';
    }
    {
      plugin = catppuccin-nvim;
      type = "lua";
      config = ''
        require("catppuccin").setup({
            transparent_background = true,
            flavour = "macchiato",
        })
        -- Set the default colorscheme here
        vim.cmd.colorscheme "catppuccin" 
      '';
    }

    # Lualine
    {
      plugin = lualine-nvim;
      type = "lua";
      config = ''
        require("lualine").setup({ options = { theme = "dracula" } })
      '';
    }

    # Neo-tree
    {
      plugin = neo-tree-nvim;
      type = "lua";
      config = ''
        vim.keymap.set('n', '<leader>e', ':Neotree toggle left<CR>')
      '';
    }
  ];
}
