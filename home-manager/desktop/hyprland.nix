{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = ", preferred, auto, 1";
      bind = [
        "SUPER SHIFT, Q, killactive"
        "SUPER CTRL SHIFT, M, exit"
        "SUPER SHIFT, A, exec, pkill wofi || wofi --show drun"
        "SUPER SHIFT, S, exec, pkill waybar || waybar"

        "SUPER, A, exec, alacritty"
        "SUPER, S, exec, firefox"
        "SUPER, D, exec, code"
        "SUPER, slash, exec, code ~/dotfiles"
        ", Print, exec, grimblast copy area"

        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"

        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"

        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"

        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"
      ];
      bindm =
        [ "SUPER, mouse:272, movewindow" "SUPER, mouse:273, resizewindow" ];

      input.force_no_accel = true;

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 3;
      };

      decoration = {
        rounding = 10;

        # Save battery
        drop_shadow = false;
        blur.enabled = false;
      };

      misc = {
        vfr = true;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };
    };
  };

  home.packages = [ pkgs.grimblast ];
}
