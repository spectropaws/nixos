{ lib, pkgs, ... }:

{
    programs.tmux.plugins = with pkgs.tmuxPlugins; [
	cpu
	resurrect
	sensible
	tmux-sessionx
	tmux-which-key
	catppuccin
    ];

    # Reload troublesome plugins again at the end
    programs.tmux.extraConfig = lib.mkOrder 3000 ''
        run-shell ${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/cpu.tmux
    '';
}
