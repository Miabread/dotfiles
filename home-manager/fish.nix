{ pkgs, inputs, ... }:

{
  programs.bash = {
    enable = true;

    # Avoid setting $SHELL globally as fish since it's non-standard
    # Coppied from `https://nixos.wiki/wiki/Fish`
    # I tweaked it slightly to set SHELL when already in fish to help user programs
    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        SHELL=${pkgs.fish}/bin/fish exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  programs.fish = {
    enable = true;
    shellInit = ''
      fish_vi_key_bindings

      # Set color scheme in tty for use over ssh
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

      set -g fish_greeting # TODO replace with something fun instead of disabling

      # Manually enable starship to have more customization
      function starship_transient_prompt_func
        # Make sure this matches programs.starship.settings.format
        starship module shlvl
        starship module character
      end
      starship init fish | source
      enable_transience
    '';
  };

  # Shell prompt
  programs.starship = {
    enable = true;

    settings = {
      # Make sure this matches programs.fish.shellInit.starship_transient_prompt_func
      format = "$all$shlvl$character";

      shlvl = {
        disabled = false;
        format = "[$symbol]($style)";
        repeat = true;
        symbol = "❯";
        repeat_offset = 1;
        threshold = 0;
      };
    };
  };

  # Command not found replacement, default doesn't support flakes
  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };
  # Database to use with above
  imports = [ inputs.nix-index-database.homeModules.nix-index ];

  # Neofetch replacement
  programs.hyfetch = {
    enable = true;
    settings = {
      preset = "transgender";
      mode = "rgb";

      # Color each flake shard
      color_align = {
        mode = "custom";
        custom_colors = {
          "1" = 1;
          "2" = 0;
        };
      };
    };
  };

  # Per-project environment management and auto nix shell loading
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  # No idea what this incantation does, copying from a year old file
  # Git blame says "Have direnv to cache globally instead of within projects - Miabread"
  home.file.".config/direnv/direnvrc".text = ''
    : ''${XDG_CACHE_HOME:=$HOME/.cache}
    declare -A direnv_layout_dirs
    direnv_layout_dir() {
      echo "''${direnv_layout_dirs[$PWD]:=$(
        echo -n "$XDG_CACHE_HOME"/direnv/layouts/
        echo -n "$PWD" | sha1sum | cut -d ' ' -f 1
      )}"
    }
  '';

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [ "--cmd" "cd" ];
  };
}
