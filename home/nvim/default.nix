{ config, inputs, ... }:

{
  imports = [ inputs.nixCats.homeModule ];

  home.sessionVariables = {
    EDITOR = "nvim";
    MANPAGER = "nvim +Man!";
  };

  nixCats = {
    enable = true;
    luaPath = ./.;

    categoryDefinitions.replace = { pkgs, ... }: {
      lspsAndRuntimeDeps = {
        general = with pkgs; [
	  ripgrep
	];
      };

      startupPlugins = {
        general = with pkgs.vimPlugins; [
          vscode-nvim
	  lualine-nvim
	  telescope-nvim
	  noice-nvim
	];
      };
    };

    packageNames = [ "nvim" ];
    packageDefinitions.replace = {
      nvim = { ... }: {
        categories = {
	  general = true;
	};
      };
    };
  };
}
