{ config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      dotfiles = "sudo nixos-rebuild switch --flake ~/dotfiles";
      nix-shell = "nix-shell --run zsh";
      neofetch = "neowofetch";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };

  programs.starship = { enable = true; };

  programs.hyfetch = {
    enable = true;
    settings = {
      preset = "transgender";
      mode = "rgb";
      color_align = { mode = "horizontal"; };
    };
  };
}
