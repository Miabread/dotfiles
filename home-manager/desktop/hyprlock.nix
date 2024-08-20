{ ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {

      background = { path = "${../../wallpaper.png}"; };

      label = {
        text = "$TIME";
        font_size = 25;
        position = "0, 80";
        halign = "center";
        valign = "center";
      };

      input-field = {
        fade_on_empty = true;
        size = "360, 60";
      };
    };
  };
}
