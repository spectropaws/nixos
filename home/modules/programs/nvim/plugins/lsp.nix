{ config, pkgs, ... }:
{
  programs.neovim = {
    extraPackages = with pkgs; [
      lua-language-server
      clang-tools
      vscode-langservers-extracted
      jdt-language-server
      typescript-language-server
      python3Packages.python-lsp-server
      bash-language-server
      rust-analyzer
      sqls
    ];
    
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          local capabilities = require("cmp_nvim_lsp").default_capabilities()
          
          -- Setup servers using the new vim.lsp.config API
          local servers = {
            "lua_ls",
            "clangd",
            "cssls",
            "html",
            "jsonls",
            "ts_ls",
            "pylsp",
            "bashls",
            "rust_analyzer",
          }
          
          for _, server in ipairs(servers) do
            vim.lsp.config[server] = {
              capabilities = capabilities,
            }
          end
          
          -- Enable servers
          for _, server in ipairs(servers) do
            vim.lsp.enable(server)
          end
          
          -- Keymaps
          vim.keymap.set("n", "<leader>cH", vim.lsp.buf.hover, { desc = "LSP Hover" })
          vim.keymap.set("n", "<leader>cD", vim.lsp.buf.definition, { desc = "Go to Definition" })
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
        '';
      }
    ];
  };
}
