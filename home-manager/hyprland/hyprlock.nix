{ config, ... }:

{
  # The login chain is as follows:
  # Auto-login -> bash starts hyprland -> hyprland starts hyprlock
  programs.bash.profileExtra = ''
    if [ "$(tty)" = "/dev/tty1" ];then
      dbus-run-session Hyprland
    fi
  '';
  wayland.windowManager.hyprland.settings.exec-once = [ "hyprlock" ];

  programs.hyprlock = {
    enable = true;
    settings = {

      background = { path = "${../../assets/wallpaper/star-lake.png}"; };

      label = {
        text = "$TIME";
        font_size = 50;
        position = "0, 80";
        halign = "center";
        valign = "center";
      };

      input-field = with config.lib.stylix.colors; {
        position = "0, -80";
        size = "200, 50";
        fade_on_empty = false;
        placeholder_text = "Password...";
        font_color = "rgb(${base05})";

        inner_color = "rgb(${base00})";
        outer_color = "rgb(${base05})";
        outline_thickness = 3;
      };
    };
  };

  stylix.targets.hyprlock.enable = false;
}
