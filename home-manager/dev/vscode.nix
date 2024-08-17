{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

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

  home.packages = with pkgs; [ nil nixfmt-classic ];
}
