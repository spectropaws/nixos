{ pkgs, ... }:
{
  programs.neovim = {
    extraPackages = with pkgs; [
      nodejs
    ];
    
    plugins = with pkgs.vimPlugins; [
      {
        plugin = copilot-lua;
        type = "lua";
        config = ''
          require("copilot").setup({
            suggestion = { enabled = false },  -- disable inline, use blink source instead
            panel = { enabled = false },
          })
        '';
      }
      
      blink-copilot
    ];
  };
}
