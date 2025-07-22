{ pkgs, ... }:
# Various apps lilac uses, they don't need their own files yet and I don't know where to put them
{
  home.packages = with pkgs; [
    vesktop # Discord client
    obsidian # Note taking
  ];

  # Terminal emulator
  programs.alacritty = { enable = true; };

  # Browser
  programs.firefox = { enable = true; };
  # This used to be handled by default but it's required explicit now for some odd reason
  stylix.targets.firefox.profileNames = [ "default" ];
}
