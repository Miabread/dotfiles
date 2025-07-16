{ pkgs, inputs, ... }:

{
  programs.bash = {
    enable = true;
    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  programs.fish = {
    enable = true;
    shellInit = ''
      fish_vi_key_bindings

      printf "\033]P0%s" "1f1f1f"
      printf "\033]P1%s" "f44747"
      printf "\033]P2%s" "608b4e"
      printf "\033]P3%s" "dcdcaa"
      printf "\033]P4%s" "569cd6"
      printf "\033]P5%s" "c678dd"
      printf "\033]P6%s" "56b6c2"
      printf "\033]P7%s" "d4d4d4"
      printf "\033]P8%s" "808080"
      printf "\033]P9%s" "f44747"
      printf "\033]PA%s" "608b4e"
      printf "\033]PB%s" "dcdcaa"
      printf "\033]PC%s" "569cd6"
      printf "\033]PD%s" "c678dd"
      printf "\033]PE%s" "56b6c2"
      printf "\033]PF%s" "d4d4d4"
    '';
  };

  # Shell prompt
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true; # Only shows above last command
  };

  # Command not found replacement, default doesn't support flakes
  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };
  imports = [ inputs.nix-index-database.homeModules.nix-index ]; # Database to use with above

  programs.hyfetch = {
    enable = true;
    settings = {
      preset = "transgender";
      mode = "rgb";
      color_align = {
        mode = "custom";
        custom_colors = {
          "1" = 1;
          "2" = 0;
        };
      };
    };
  };
}
