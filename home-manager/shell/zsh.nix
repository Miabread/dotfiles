{ config, ... }:

{
  programs.alacritty = { enable = true; };

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
      neofetch = "hyfetch";
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

  programs.hyfetch = {
    enable = true;
    settings = {
      preset = "transgender";
      mode = "rgb";
      color_align = {
        mode = "custom";
        custom_colors = {
          "1" = 1;
          "2" = 0;
        };
      };
    };
  };
}
