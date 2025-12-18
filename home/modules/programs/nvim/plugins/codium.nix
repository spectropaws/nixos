{ config, pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = windsurf-vim;
      type = "lua";
      config = ''
        -- Codeium keymaps
        vim.keymap.set("i", "<C-g>", function()
          return vim.fn["codeium#Accept"]()
        end, { expr = true, silent = true, desc = "Accept Codeium suggestion" })
        
        vim.keymap.set("i", "<C-;>", function()
          return vim.fn["codeium#CycleCompletions"](1)
        end, { expr = true, silent = true, desc = "Next Codeium suggestion" })
        
        vim.keymap.set("i", "<C-,>", function()
          return vim.fn["codeium#CycleCompletions"](-1)
        end, { expr = true, silent = true, desc = "Previous Codeium suggestion" })
        
        vim.keymap.set("i", "<C-x>", function()
          return vim.fn["codeium#Clear"]()
        end, { expr = true, silent = true, desc = "Clear Codeium suggestion" })
      '';
    }
  ];
}
