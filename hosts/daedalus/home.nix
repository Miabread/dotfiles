{ ... }:

{
  imports = [
    ../../home-manager/shell/fish.nix
    ../../home-manager/nvim
    ../../home-manager/git.nix
  ];

  # Home-manager core options
  home.username = "miabread";
  home.homeDirectory = "/home/miabread";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
