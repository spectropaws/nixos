{ config, pkgs, ... }:
{
  imports = [
    ./plugins/lsp.nix
    ./plugins/cmp.nix
    ./plugins/treesitter.nix
    ./plugins/colorschemes.nix
    ./plugins/lualine.nix
    ./plugins/neo-tree.nix
    ./plugins/which-key.nix
    ./plugins/gitsigns.nix
    ./plugins/telescope.nix
    ./plugins/none-ls.nix
    ./plugins/copilot.nix
    ./plugins/codium.nix
  ];
  
  programs.neovim = {
    enable = true;
    
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    
    extraPackages = with pkgs; [
      wl-clipboard
      ripgrep
      fd
    ];
    
    extraLuaConfig = ''
      -- Basic Settings
      vim.opt.expandtab = true
      vim.opt.tabstop = 4
      vim.opt.softtabstop = 4
      vim.opt.shiftwidth = 4
      
      -- UI Settings
      vim.opt.relativenumber = true
      vim.opt.number = true
      
      -- Clipboard
      vim.opt.clipboard = 'unnamedplus'
      
      -- Keymaps
      vim.g.mapleader = " "
    '';
  };
}
