{ pkgs, ... }:

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

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;
  };

  programs.fish = {
    enable = true;
    shellInit = ''
      fish_vi_key_bindings
    '';
  };

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

  programs.nvf = {
    enable = true;

    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;

      vim.extraPlugins = {
        vscode = { 
          package = pkgs.vimPlugins.vscode-nvim;
          setup = "require('vscode').load('dark')";
        };
      };

      # Status line
      vim.statusline.lualine.enable = true;
      vim.statusline.lualine.setupOpts.options.theme = "vscode";
      vim.options.showmode = false;

      vim.options = {
        mouse = "";
      };
    };
  };
}
