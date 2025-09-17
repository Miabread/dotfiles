{ config, ... }:

{
  # Status bar
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "group/dashboard" ];
        modules-right = [ "custom/music" "group/networking" ];

        "group/dashboard" = {
          orientation = "horizontal";
          modules = [
            "pulseaudio#input"
            "pulseaudio#output"
            "clock"
            "clock#date"
            "battery"
            "backlight"
          ];
        };

        "group/networking" = {
          orientation = "horizontal";
          modules = [ "bluetooth" "network" ];
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
          };
          persistent-workspaces."*" = [ 1 2 3 4 5 ];

          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };

        "hyprland/window" = {
          format = "{title}";
          rewrite = { "(.*) — Mozilla Firefox" = "Firefox"; };

          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = [ "󰃠" ];
        };

        "pulseaudio#input" = {
          format-source = " {volume}%";
          format-source-muted = " off";
          format = "{format_source}";
        };

        "pulseaudio#output" = {
          format = "{icon} {volume}%";
          format-muted = "";
          format-icons = { default = [ "" "" ]; };
        };

        "clock" = {
          format = "󰥔 {:%H:%M}";
          tooltip-format = "{:%I:%M %p}";
        };

        "battery" = {
          format = "{icon} {capacity}%";
          format-icons = [ "" "" "" "" "" ];
        };

        "clock#date" = {
          format = " {:%m/%d}";
          tooltip-format = "{:%a %b %Y-%m-%d}";
        };

        "custom/music" = { format = "music placeholder"; };

        "network" = {
          format = "{ifname}";
          format-wifi = " {essid} ({signalStrength}%)";
          format-ethernet = " Wired";
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

      #pulseaudio, #clock, #battery, #bluetooth {
        margin-right: 20px;
      }

      #workspaces {
        padding: 0px;
      }

      #workspaces button {
        border-radius: 0px;
      }

      #workspaces button:first-child {
        border-top-left-radius: 5px; /* parent radius - parent width - 2 to get rid of gap */
        border-bottom-left-radius: 5px;
      }

      #workspaces button:last-child {
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
      }

      #workspaces button.empty {
        color: ${base03};
      }

      #workspaces button.active {
        background-color: ${base0D};
        color: ${base00};
      }

      #workspaces button.urgent {
        background-color: ${base05};
        color: ${base00};
      }

      window#waybar.empty #window {
        background-color: transparent;
        border-color: transparent;
      }
    '';
  };

  stylix.targets.waybar.enable = false;
}
