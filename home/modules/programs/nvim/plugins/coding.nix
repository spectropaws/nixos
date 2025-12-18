{ config, pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # Copilot (Vim version)
    {
      plugin = copilot-vim;
      type = "lua";
      config = ""; # Default config
    }

    # Codeium (Disabled)
    # {
    #   plugin = codeium-vim;
    #   type = "lua";
    #   config = ''
    #     vim.keymap.set("i", "<C-g>", function() return vim.fn["codeium#Accept"]() end, { expr = true, silent = true })
    #     vim.keymap.set("i", "<c-;>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true, silent = true })
    #     vim.keymap.set("i", "<c-,>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true, silent = true })
    #     vim.keymap.set("i", "<c-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true, silent = true })
    #   '';
    # }
  ];
}
