{ pkgs, ... }:
# Various apps lilac uses, they don't need their own files yet and I don't know where to put them
{
  home.packages = with pkgs; [ vesktop obsidian ];

  programs.alacritty = { enable = true; };

  programs.firefox = { enable = true; };
  stylix.targets.firefox.profileNames = [ "default" ];
}
