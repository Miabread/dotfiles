{ config, lib, ... }:

{
  programs.wofi = {
    enable = true;

    style = with config.lib.stylix.colors.withHashtag;
      with config.stylix.fonts;
      lib.mkForce ''
        window {
          font-family: "${monospace.name}";
          font-size: ${toString sizes.popups};

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
}
