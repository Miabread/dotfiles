{ config, ... }:

{
  # App launcher
  # TODO shell commands show up here but do nothing, maybe either filter or start them in a term
  programs.wofi = {
    enable = true;

    settings = { no_actions = true; };

    style = with config.lib.stylix.colors.withHashtag; ''
      window {
        font-family: "${config.stylix.fonts.monospace.name}";
        font-size: ${toString config.stylix.fonts.sizes.popups};

        background-color: ${base00};
        color: ${base05};

        margin: 0px;
        border: 3px solid ${base0D};
        border-radius: 10px;
      }

      #entry:selected {
        background-color: ${base02};
      }

      #input {
        background-color: ${base01};
        color: ${base04};
        margin: 5px;
        border: none;
      }

      #inner-box {
        margin: 5px;
        border: none;
      }

      #outer-box {
        margin: 5px;
        border: none;
      }

      #scroll {
        margin: 0px;
        border: none;
      }

      #text {
        margin: 5px;
        border: none;
      }
    '';
  };

  stylix.targets.wofi.enable = false;
}
