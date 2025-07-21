{ pkgs, ... }:

{
  imports = [
    ../../home-manager/shell/zsh.nix
    ../../home-manager/vscode
    ../../home-manager/hyprland
    ../../home-manager/git-lilac-temp.nix
  ];

  # User packages
  home.packages = with pkgs; [ vesktop obsidian ];
  programs.firefox = { enable = true; };
  stylix.targets.firefox.profileNames = [ "default" ];

  # Home-manager core options
  home.username = "miabread";
  home.homeDirectory = "/home/miabread";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
