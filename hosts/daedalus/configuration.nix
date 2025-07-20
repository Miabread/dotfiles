# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../nixos/syncthing.nix
    ];

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/miabread/.config/sops/age/keys.txt";

    secrets.git-credentials.owner = "miabread";
  };

  environment.systemPackages = [ 
    pkgs.just
    pkgs.ripgrep
    pkgs.rsync
  ];

  services.openssh = { 
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = [ "miabread" ];
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "miabread" = import ./home.nix; };
    useGlobalPkgs = true;
  };

  users.users.miabread = {
    isNormalUser = true;
    description = "Miabread";
    extraGroups = [ "networkmanager" "wheel" ];
    initialPassword = "hunter2";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  users.mutableUsers = false;
  users.users.root.initialPassword = "hunter2";

  environment.persistence."/nix/persist" = {
    directories = [
      "/etc/nixos"
      "/var/lib"
      "/var/log"
      "/srv"
      "/data"
    ];
    files = [
      "/etc/machine-id"
    ];
    users.miabread = {
      directories = [
        ".local/share/fish"
      ];
      files = [
        ".bash_history"
	".config/sops/age/keys.txt"
      ];
    };
  };

  boot.loader.systemd-boot.enable = true;

  networking.hostName = "daedalus"; # Define your hostname.
  networking.hostId = "f0e87880"; # For zsh -mia
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}

