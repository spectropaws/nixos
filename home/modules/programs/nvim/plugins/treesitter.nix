{ pkgs, ... }:
{
  programs.neovim.plugins = [
    {
      plugin = pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
        p.c p.cpp
        p.html p.css
        p.javascript p.typescript p.tsx
        p.json
        p.python
        p.rust
        p.lua
        p.java
        p.php
        p.regex
        p.bash
        p.nix    
        p.markdown
        p.yaml
        p.toml
      ]);
      type = "lua";
      config = ''
        -- configs module is gone in treesitter main branch
        -- highlight and indent are enabled by default
        -- only needed if you want to explicitly override
        vim.treesitter.language.register("markdown", "mdx")
      '';
    }
  ];
}
