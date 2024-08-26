{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right =
          [ "network" "bluetooth" "pulseaudio" "backlight" "battery" "clock" ];

        "hyprland/workspaces" = {
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";

          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
          };
          persistent-workspaces."*" = 5;
        };

        "hyprland/window" = {
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };

        "network" = {
          format = "{ifname}";
          format-wifi = " {essid} ({signalStrength}%)";
          format-ethernet = " {ipaddr}/{cidr}";
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "";
          format-icons = { default = [ "" "" ]; };
        };

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = [ "" ];
        };

        "battery" = {
          format = "{icon} {capacity}%";
          format-icons = [ "" "" "" "" "" ];
        };

        "clock" = { format = " {:%H:%M}"; };
      };
    };
  };

  home.packages = [ pkgs.font-awesome ];
}
