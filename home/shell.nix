{ ... }:

{
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      default_shell = "fish";
      simplified_ui = true;
      show_startup_tips = false;
      show_release_notes = false;
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;
  };

  programs.fish = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
  };
}
