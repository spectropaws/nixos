{ pkgs, ... }:

{
    plugin = pkgs.tmuxPlugins.mkTmuxPlugin {
        pluginName = "tmux-which-key";
        version = "unstable";
        src = pkgs.fetchFromGitHub {
            owner = "alexwforsythe";
            repo = "tmux-which-key";
            rev = "main";
            sha256 = "sha256-X7FunHrAexDgAlZfN+JOUJvXFZeyVj9yu6WRnxMEA8E=";
        };
    };
}
