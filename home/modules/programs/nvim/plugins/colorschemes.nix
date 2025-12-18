{ config, pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    nvim-web-devicons
    
    {
      plugin = tokyonight-nvim;
      type = "lua";
      config = ''
        require("tokyonight").setup({
          transparent = true,
          styles = { sidebars = "transparent", floats = "transparent" },
        })
	vim.cmd.colorscheme "tokyonight"
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
        -- Set the default colorscheme
        vim.cmd.colorscheme "catppuccin"
      '';
    }
  ];
}
