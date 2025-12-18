{ config, pkgs, ... }:
{
  programs.neovim = {
    extraPackages = with pkgs; [
      lazygit
    ];
    
    plugins = with pkgs.vimPlugins; [
      {
        plugin = lazygit-nvim;
        type = "lua";
        config = ''
          -- LazyGit keybinding
          vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', { desc = "LazyGit" })
        '';
      }
    ];
  };
}
