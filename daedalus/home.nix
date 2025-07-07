{ pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      default_shell = "fish";
      simplified_ui = true;
      show_startup_tips = false;
      show_release_notes = false;
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;
  };

  programs.fish = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
  };

  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = "Miabread";
    userEmail = "miabreadloaf@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  home.username = "miabread";
  home.homeDirectory = "/home/miabread";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
