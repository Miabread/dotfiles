{ inputs, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    extensions =
      with inputs.nix-vscode-extensions.extensions."x86_64-linux".vscode-marketplace; [
        jnoortheen.nix-ide
        streetsidesoftware.code-spell-checker
        icrawl.discord-vscode
        mkhl.direnv
      ];

    userSettings = {
      # General
      "explorer.confirmDelete" = false;
      "git.confirmSync" = false;
      "git.autofetch" = true;
      "git.enableSmartCommit" = true;
      "explorer.confirmDragAndDrop" = false;

      # Visuals
      "window.menuBarVisibility" = "toggle";
      "editor.minimap.enabled" = true;
      "editor.minimap.renderCharacters" = false;
      "editor.fontLigatures" = true;

      # Nix
      "nix.enableLanguageServer" = true;
      "nix.serverSettings" = { nil.formatting.command = [ "nixfmt" ]; };
    };
  };

  # Want these everywhere for projects' shell.nixes
  home.packages = with pkgs; [ nil nixfmt-classic ];
}
