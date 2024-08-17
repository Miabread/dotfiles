{ pkgs, ... }:

{
  stylix = {
    enable = true;
    image = ../wallpaper.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ocean.yaml";

    fonts = {
      monospace = {
        package = pkgs.fira-code;
        name = "Fira Code";
      };
    };
  };
}
