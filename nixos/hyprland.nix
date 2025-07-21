{ pkgs, ... }:
# This is all stuff lilac needed to get Hyprland working, it's been over a year so I have no idea what this does
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  security.pam.services.hyprlock = { };

  environment.systemPackages = with pkgs; [
    acpi # Battery command
    libnotify
    brightnessctl
  ];
}
