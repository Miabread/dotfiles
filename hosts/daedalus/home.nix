{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nvf.homeManagerModules.default
    ../../home/shell.nix
  ];

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
