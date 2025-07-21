{ ... }:

{
  imports = [
    ../../home-manager/fish.nix
    ../../home-manager/vscode.nix
    ../../home-manager/nvim
    ../../home-manager/hyprland
    ../../home-manager/git.nix
    ../../home-manager/desktop-apps.nix
  ];

  # Home-manager core options
  home.username = "miabread";
  home.homeDirectory = "/home/miabread";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
