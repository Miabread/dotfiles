{ inputs, ... }:
let package-name = "nvim";
in {
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
        general = with pkgs;
          [
            ripgrep # Dep of telescope
            fd # Dep of telescope
          ];
      };

      startupPlugins = {
        general = with pkgs.vimPlugins; [
          vscode-nvim # Color scheme
          lualine-nvim # Status line replacement
          telescope-nvim # Multi tool selector
          noice-nvim # Command line replacement
          gitsigns-nvim # Git display
          toggleterm-nvim # Terminal replacement
          nvim-treesitter.withAllGrammars # Language parser and highlighting
          nvim-notify # Notifications replacement
          indent-blankline-nvim # Show intendation
          nvim-lspconfig # Default config for language servers
        ];
      };
    };

    packageNames = [ package-name ];
    packageDefinitions.replace = {
      nvim = { ... }: { categories = { general = true; }; };
    };
  };
}
