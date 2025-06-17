{ inputs, pkgs, ... }:

{
  programs.vscode.enable = true;
  programs.vscode.profiles.default = {
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
      "workbench.startupEditor" = "none";

      # Visuals
      "window.menuBarVisibility" = "toggle";
      "editor.minimap.enabled" = true;
      "editor.minimap.renderCharacters" = false;
      "editor.fontLigatures" = true;

      # Nix
      "nix.enableLanguageServer" = true;
      "nix.serverSettings" = { nil.formatting.command = [ "nixfmt" ]; };

      # Rust
      "rust-analyzer.inlayHints.chainingHints.enable" = false;
      "rust-analyzer.inlayHints.parameterHints.enable" = false;
      "rust-analyzer.inlayHints.genericParameterHints.const.enable" = false;
      "rust-analyzer.inlayHints.typeHints.enable" = false;
    };
  };

  # Want these everywhere for projects' shell.nixes
  home.packages = with pkgs; [ nil nixfmt-classic ];
}
