{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    friendly-snippets
    {
      plugin = blink-cmp;
      type = "lua";
      config = ''
        require("blink.cmp").setup({
          keymap = {
            preset = "default",
            ["<CR>"]    = { "accept", "fallback" },
            ["<Tab>"]   = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<C-b>"]   = { "scroll_documentation_up", "fallback" },
            ["<C-f>"]   = { "scroll_documentation_down", "fallback" },
          },
          appearance = {
            nerd_font_variant = "mono",
          },
          sources = {
            default = { "lsp", "path", "snippets", "buffer", "copilot" },
            providers = {
              copilot = {
                name = "copilot",
                module = "blink-copilot",
                score_offset = 100,
                async = true,
                opts = {
                  max_completions = 3,
                  max_attempts = 4,
                  kind_name = "Copilot",
                  kind_icon = " ",
                  debounce = 200,
                  auto_refresh = { backward = true, forward = true },
                },
              },
            },          
          },
          completion = {
            documentation = {
              auto_show = true,
              auto_show_delay_ms = 200,
            },
          },
          fuzzy = { implementation = "lua" },
        })
      '';
    }
  ];
}
