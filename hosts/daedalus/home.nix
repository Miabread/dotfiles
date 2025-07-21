{ pkgs, inputs, ... }:

{
  imports = [ ../../home-manager/shell.nix ../../home-manager/nvim ];

  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = "Miabread";
    userEmail = "miabreadloaf@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "store --file /run/secrets/git-credentials";
    };
  };

  home.username = "miabread";
  home.homeDirectory = "/home/miabread";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
