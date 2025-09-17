{ pkgs, config, ... }:

{
  stylix = {
    enable = true;
    image = ../../assets/wallpaper/star-lake.png;
    polarity = "dark";

    base16Scheme = {
      # Generated
      base00 = "252724";
      base01 = "464944";
      base02 = "676b65";
      base03 = "888d85";
      base04 = "a9afa5";
      base05 = "cad1c6";
      base06 = "d1d7ce";
      base07 = "d9ded7";

      # Handpicked
      base08 = "#F09F6E";
      base09 = "#E5CBBA";
      base0A = "#FEEBC3";
      base0B = "#B9D2A8";
      base0C = "#A7C4C2";
      base0D = "#87B4D0";
      base0E = "#97A5D3";
      base0F = "#DAC0B1";
    };

    fonts = {
      serif = {
        package = pkgs.roboto-slab;
        name = "Roboto Slab";
      };

      sansSerif = {
        package = pkgs.fira;
        name = "Fira Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "Fira Code Nerd Font Propo";
      };

      emoji = {
        package = pkgs.twitter-color-emoji;
        name = "Twitter Color Emoji";
      };
    };

    # Some reason stylix installs chrome accidentally
    targets.chromium.enable = false;
  };
}
