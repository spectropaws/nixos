{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name  = "spectropaws";
      user.email = "spectropaws777@gmail.com";
      init.defaultBranch = "main";
      core.editor = "nvim";
      pull.rebase = false;
    };
  };
}
