{ pkgs, ... }:

{
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
}
