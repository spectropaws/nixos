{ pkgs, ... }:
{
  programs.neovim = {
    extraPackages = with pkgs; [
      lua-language-server
      clang-tools
      vscode-langservers-extracted
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
          local capabilities = require("blink.cmp").get_lsp_capabilities()

          -- Configure each server using the 0.11+ function call API
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
            "sqls",
          }

          for _, server in ipairs(servers) do
            vim.lsp.config(server, { capabilities = capabilities })
            vim.lsp.enable(server)
          end

          -- LSP keymaps on attach
          vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
              local buf = event.buf
              vim.keymap.set("n", "K",           vim.lsp.buf.hover,        { buffer = buf, desc = "LSP Hover" })
              vim.keymap.set("n", "gd",          vim.lsp.buf.definition,   { buffer = buf, desc = "Go to Definition" })
              vim.keymap.set("n", "gD",          vim.lsp.buf.declaration,  { buffer = buf, desc = "Go to Declaration" })
              vim.keymap.set("n", "<leader>cr",  vim.lsp.buf.rename,       { buffer = buf, desc = "Rename" })
              vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = buf, desc = "Code Action" })
              vim.keymap.set("n", "<leader>cd",  vim.diagnostic.open_float, { buffer = buf, desc = "Line Diagnostics" })
              vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { buffer = buf, desc = "Prev Diagnostic" })
              vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1,  float = true }) end, { buffer = buf, desc = "Next Diagnostic" })
            end,
          })

          -- Diagnostic display
          vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            float = { border = "rounded" },
          })
        '';
      }
    ];
  };
}
