{ pkgs, ... }:

{
    plugin = pkgs.tmuxPlugins.mkTmuxPlugin {
        pluginName = "tmux-sessionx";
        version = "unstable";
        src = pkgs.fetchFromGitHub {
            owner = "omerxx";
            repo = "tmux-sessionx";
            rev = "main";
            sha256 = "sha256-Iue1Y7WViAm92+qM96EowthpXwYrkeLudlWUXIzk368=";
        };
    };    
}
