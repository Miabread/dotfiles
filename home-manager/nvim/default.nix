{ config, inputs, ... }:
let package-name = "nvim"; in
{
  imports = [ inputs.nixCats.homeModule ];

  home.sessionVariables = {
    EDITOR = package-name;
    MANPAGER = "${package-name} +Man!";
  };

  nixCats = {
    enable = true;
    luaPath = ./.;

    categoryDefinitions.replace = { pkgs, ... }: {
      lspsAndRuntimeDeps = {
        general = with pkgs; [
	  ripgrep # Dep of telescope
	];
      };

      startupPlugins = {
        general = with pkgs.vimPlugins; [
          vscode-nvim # Color scheme
	  lualine-nvim # Status line repalcement
	  telescope-nvim # Multi tool selector
	  noice-nvim # Command line replacement
	  gitsigns-nvim # Git display
	  toggleterm-nvim # Terminal replacement
	];
      };
    };

    packageNames = [ package-name ];
    packageDefinitions.replace = {
      nvim = { ... }: {
        categories = {
	  general = true;
	};
      };
    };
  };
}
