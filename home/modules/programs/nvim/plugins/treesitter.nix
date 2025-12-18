{ config, pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-treesitter.withPlugins (p: [
        p.c
        p.cpp
        p.html
        p.css
        p.javascript
        p.typescript
        p.json
        p.php
        p.python
        p.regex
        p.rust
        p.tsx
        p.java
        p.lua
      ]);
      type = "lua";
      config = ''
        require("nvim-treesitter.configs").setup({
          highlight = { enable = true },
          indent = { enable = true },
        })
      '';
    }
  ];
}
