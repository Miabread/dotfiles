{ config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      dotswitch = "sudo nixos-rebuild switch --flake ~/dotfiles";
      dottest = "sudo nixos-rebuild test --flake ~/dotfiles";
      dotupdate = "sudo nix flake update";
      nix-shell = "nix-shell --run zsh";
      neofetch = "neowofetch";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    loginExtra = ''
      if [ "$(tty)" = "/dev/tty1" ];then
        dbus-run-session Hyprland
      fi
    '';
  };

  programs.starship = { enable = true; };
}
