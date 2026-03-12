{ pkgs, ... }:

{
    plugin = pkgs.tmuxPlugins.mkTmuxPlugin {
        pluginName = "tmux-nerd-font-window-name";
        version = "unstable";
        src = pkgs.fetchFromGitHub {
            owner = "joshmedeski";
            repo = "tmux-nerd-font-window-name";
            rev = "main";
            sha256 = "sha256-i3DT+r7WUvutRhob+tHZOe8TBUxpe4JflS9e1dgkg6s=";
        };
    };
}
