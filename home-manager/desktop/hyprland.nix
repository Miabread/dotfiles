{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = ", preferred, auto, 1";

      exec-once = [ "hyprlock" "waybar" ];
      exec = [ "wl-gammarelay-rs" ];

      bindl = [
        ", switch:on:Lid Switch, exec, hyprlock"

        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", Print, exec, grimblast copy area"

        "CTRL, XF86MonBrightnessDown, exec, busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 4500"
        "CTRL, XF86MonBrightnessUp, exec, busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6500"
        "CTRL, Print, exec, grimblast copy screen"
      ];

      bind = [
        "SUPER CTRL SHIFT, M, exit"
        "SUPER, Tab, exec, pkill wofi || wofi --show drun"
        "SUPER SHIFT, Tab, exec, pkill waybar || waybar"
        "SUPER, slash, exec, code ~/dotfiles"
        "SUPER, L, exec, hyprlock"
        "SUPER, F, togglefloating"

        "SUPER CTRL, Q, killactive"
        "SUPER CTRL, W, exec, alacritty"
        "SUPER CTRL, A, exec, firefox"
        "SUPER CTRL, S, exec, code"
        "SUPER CTRL, D, exec, obsidian"
        "SUPER CTRL, X, exec, vesktop"
        # "SUPER CTRL, C, exec, music"

        "SUPER, A, workspace, 1"
        "SUPER, S, workspace, 2"
        "SUPER, D, workspace, 3"
        "SUPER, X, workspace, 4"
        "SUPER, C, workspace, 5"

        "SUPER SHIFT, A, movetoworkspace, 1"
        "SUPER SHIFT, S, movetoworkspace, 2"
        "SUPER SHIFT, D, movetoworkspace, 3"
        "SUPER SHIFT, X, movetoworkspace, 4"
        "SUPER SHIFT, C, movetoworkspace, 5"

        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"

        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"
      ];

      bindm =
        [ "SUPER, mouse:272, movewindow" "SUPER, mouse:273, resizewindow" ];

      windowrulev2 = [
        "workspace 1, class:(firefox)"
        "workspace 2, class:(Code)"
        "workspace 3, class:(obsidian)"
        "workspace 4, class:(vesktop)"
      ];

      input = {
        force_no_accel = true;
        kb_options = "ctrl:nocaps";
      };

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

  home.packages = with pkgs; [ grimblast wl-gammarelay-rs ];
}
