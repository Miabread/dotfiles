{ pkgs, ... }:

{
  imports = [
    ../../home-manager/fish.nix
    ../../home-manager/vscode
    ../../home-manager/nvim
    ../../home-manager/hyprland
    ../../home-manager/git.nix
  ];

  # User packages
  home.packages = with pkgs; [ vesktop obsidian ];
  programs.firefox = { enable = true; };
  stylix.targets.firefox.profileNames = [ "default" ];
  programs.alacritty = { enable = true; };

  # Home-manager core options
  home.username = "miabread";
  home.homeDirectory = "/home/miabread";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
