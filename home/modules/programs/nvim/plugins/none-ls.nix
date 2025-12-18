{ config, pkgs, ... }:
{
  programs.neovim = {
    extraPackages = with pkgs; [
      stylua
      prettierd
      black
      isort
    ];
    
    plugins = with pkgs.vimPlugins; [
      {
        plugin = none-ls-nvim;
        type = "lua";
        config = ''
          local null_ls = require("null-ls")
          
          null_ls.setup({
            sources = {
              -- Use the built-in formatters from null-ls
              null_ls.builtins.formatting.stylua,
              null_ls.builtins.formatting.prettierd,
              null_ls.builtins.formatting.black,
              null_ls.builtins.formatting.isort,
            },
          })
          
          -- Keymap for formatting
          vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format code" })
        '';
      }
    ];
  };
}
