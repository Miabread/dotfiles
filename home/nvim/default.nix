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
      startupPlugins = {
        general = with pkgs.vimPlugins; [
          vscode-nvim
	  lualine-nvim
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
