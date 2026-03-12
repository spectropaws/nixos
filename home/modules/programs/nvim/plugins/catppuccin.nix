{ pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    nvim-web-devicons
    {
      plugin = catppuccin-nvim;
      type = "lua";
      config = ''
        require("catppuccin").setup({
          flavour = "mocha",
          transparent_background = true,
          integrations = {
            blink_cmp = true,
            bufferline = true,
            gitsigns = true,
            neo_tree = true,
            telescope = { enabled = true },
            treesitter = true,
            which_key = true,
          },
        })
        vim.cmd.colorscheme("catppuccin")
      '';
    }
  ];
}
