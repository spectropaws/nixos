{ pkgs, ... }:
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
        plugin = conform-nvim;
        type = "lua";
        config = ''
          require("conform").setup({
            formatters_by_ft = {
              lua        = { "stylua" },
              javascript = { "prettierd" },
              typescript = { "prettierd" },
              css        = { "prettierd" },
              html       = { "prettierd" },
              json       = { "prettierd" },
              python     = { "isort", "black" },
            },
            format_on_save = {
              timeout_ms = 500,
              lsp_fallback = true,
            },
          })

          vim.keymap.set({ "n", "v" }, "<leader>cf",
            function() require("conform").format({ async = true, lsp_fallback = true }) end,
            { desc = "Format code" }
          )
        '';
      }
    ];
  };
}
