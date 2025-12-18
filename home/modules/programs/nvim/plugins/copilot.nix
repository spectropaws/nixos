{ config, pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = copilot-vim;
      type = "lua";
      config = ''
        -- Copilot will use default settings
        -- Accept suggestion: <Tab> or <C-]>
        -- Next suggestion: <M-]>
        -- Previous suggestion: <M-[>
        -- Dismiss suggestion: <C-e>
      '';
    }
  ];
}

