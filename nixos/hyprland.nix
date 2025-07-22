{ config, pkgs, ... }:
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

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Auto-login when on tty1, lock screen is handled by GUI
  systemd.services."getty@tty1" = {
    overrideStrategy = "asDropin";
    serviceConfig.ExecStart = [
      ""
      "@${pkgs.util-linux}/sbin/agetty agetty --login-program ${config.services.getty.loginProgram} --autologin miabread --noclear --keep-baud %I 115200,38400,9600 $TERM"
    ];
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
