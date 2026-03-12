{ lib, pkgs, config, ... }:

let
  hmDir = config.home.homeDirectory;
  catppuccinPlugin = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "catppuccin";
    version = "unstable";
    src = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "tmux";
      rev = "main";
      sha256 = "sha256-godCgBMgqzim+W3O2sHcgw91h7sHsKHjd02BdLuazZ8=";
    };
  };
  statusModulePath = "${catppuccinPlugin}/share/tmux-plugins/catppuccin/utils/status_module.conf";
in
{
  home.file = {
    ".config/tmux/custom_modules/ctp_cpu.conf".text = ''
      %hidden MODULE_NAME="ctp_cpu"
      set -gq '@cpu_low_bg_color' '#{E:@thm_green}'
      set -gq '@cpu_medium_bg_color' '#{E:@thm_yellow}'
      set -gq '@cpu_high_bg_color' '#{E:@thm_red}'
      set -gq "@catppuccin_''${MODULE_NAME}_icon" ' '
      set -gq "@catppuccin_''${MODULE_NAME}_color" '#{l:#{cpu_bg_color}}'
      set -gq "@catppuccin_''${MODULE_NAME}_text" ' #{l:#{cpu_percentage}}'
      source -F "${statusModulePath}"    
  '';

    ".config/tmux/custom_modules/ctp_memory.conf".text = ''
      %hidden MODULE_NAME='ctp_memory'
      set -gq '@ram_low_bg_color' '#{E:@thm_green}'
      set -gq '@ram_medium_bg_color' '#{E:@thm_yellow}'
      set -gq '@ram_high_bg_color' '#{E:@thm_red}'
      set -gq "@catppuccin_''${MODULE_NAME}_icon" ' '
      set -gq "@catppuccin_''${MODULE_NAME}_color" '#{l:#{ram_bg_color}}'
      set -gq "@catppuccin_''${MODULE_NAME}_text" ' #{l:#{ram_percentage}}'
      source -F "${statusModulePath}"
    '';
  };

  programs.tmux.extraConfig = lib.mkOrder 1500 ''
    source -F "${hmDir}/.config/tmux/custom_modules/ctp_cpu.conf"
    source -F "${hmDir}/.config/tmux/custom_modules/ctp_memory.conf"
  '';
}
