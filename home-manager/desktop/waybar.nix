{ pkgs, config, lib, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "group/dashboard" ];
        modules-right = [ "custom/music" "group/networking" ];

        "group/dashboard" = {
          orientation = "horizontal";
          modules = [ "backlight" "pulseaudio" "clock" "battery" "clock#date" ];
        };

        "group/networking" = {
          orientation = "horizontal";
          modules = [ "bluetooth" "network" ];
        };

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
          format = "{title}" + lib.strings.replicate 100 " ";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = [ "" ];
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "";
          format-icons = { default = [ "" "" ]; };
        };

        "clock" = { format = " {:%H:%M}"; };

        "battery" = {
          format = "{icon} {capacity}%";
          format-icons = [ "" "" "" "" "" ];
        };

        "clock#date" = { format = " {:%m:%d}"; };

        "custom/music" = {
          format = lib.strings.replicate 30 " " + "music placeholder";
        };

        "network" = {
          format = "{ifname}";
          format-wifi = " {essid} ({signalStrength}%)";
          format-ethernet = " {ipaddr}/{cidr}";
        };
      };
    };

    style = with config.lib.stylix.colors.withHashtag; ''
      window#waybar {
        background: transparent;
      }

      window > box {
        font-family: "${config.stylix.fonts.monospace.name}";
        font-size: 13px;
        color: ${base05};
        margin: 10px 15px 0px; /* left-right margin accounts for module's margin */
      }

      #workspaces, #window, #dashboard, #custom-music, #networking {
        background-color: ${base00};
        border: 3px solid ${base0D};
        border-radius: 10px;
        padding: 0px 15px;
        margin: 0px 5px;
      }

      #backlight, #pulseaudio, #clock, #battery, #bluetooth {
        margin-right: 20px;
      }

      #window {
        /* min-width: 400px; */
      }
    '';
  };

  stylix.targets.waybar.enable = false;

  home.packages = [ pkgs.font-awesome ];
}
