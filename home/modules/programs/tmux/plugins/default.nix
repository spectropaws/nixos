{ lib, pkgs, ... }:

{
    programs.tmux.plugins = with pkgs.tmuxPlugins; [
	( import ./nerd-font.nix {inherit pkgs;} )
	( import ./sensible.nix {inherit pkgs;} )
	( import ./resurrect.nix {inherit pkgs;} )
	( import ./sessionx.nix {inherit pkgs;} )
	( import ./which-key.nix {inherit pkgs;} )
	( import ./cpu.nix {inherit pkgs;} )

    ];

    # Reload troublesome plugins again at the end
    programs.tmux.extraConfig = lib.mkOrder 3000 ''
        run-shell ${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/cpu.tmux
    '';
}
