{ config, pkgs, ... }:
{
  imports = [
    ./plugins/lsp.nix
    ./plugins/blink.nix
    ./plugins/treesitter.nix
    ./plugins/catppuccin.nix
    ./plugins/lualine.nix
    ./plugins/neo-tree.nix
    ./plugins/which-key.nix
    ./plugins/gitsigns.nix
    ./plugins/telescope.nix
    ./plugins/conform.nix
    ./plugins/copilot.nix
    ./plugins/codium.nix
    ./plugins/alpha.nix
    ./plugins/bufferline.nix
    ./plugins/lazygit.nix
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
    
    initLua = ''
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

      vim.api.nvim_create_autocmd("ColorScheme", {
          pattern = "*",
          callback = function()
            -- 1. White Relative Line Numbers
            -- "LineNr" is the current absolute line number
            -- "LineNrAbove" and "LineNrBelow" are the relative ones
            vim.api.nvim_set_hl(0, "LineNr", { fg = "#D0D0D0", bg = "NONE" })
            vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#D0D0D0", bg = "NONE" })
            vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#D0D0D0", bg = "NONE" })
            
            -- Optional: Make the current cursor line number bold and white too
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#D0D0D0", bold = true, bg = "NONE" })
	  end,
      })
    '';
  };
}
