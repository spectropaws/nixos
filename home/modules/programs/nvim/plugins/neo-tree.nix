{ config, pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    nui-nvim
    plenary-nvim
    
    {
      plugin = neo-tree-nvim;
      type = "lua";
      config = ''
        vim.keymap.set('n', '<leader>e', ':Neotree toggle left<CR>', { desc = "Toggle Neo-tree" })
      '';
    }
  ];
}
