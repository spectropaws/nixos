{ config, pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
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
  ];
}
