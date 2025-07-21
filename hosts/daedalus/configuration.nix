# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ pkgs, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../nixos/syncthing.nix
    ../../nixos/openssh.nix
  ];

  # System packages
  environment.systemPackages = [ pkgs.just pkgs.ripgrep pkgs.rsync ];

  # Create main user and connect home-manager
  users = {
    mutableUsers = false;
    users.root.initialPassword = "hunter2";

    users.miabread = {
      isNormalUser = true;
      description = "Miabread";
      extraGroups = [ "networkmanager" "wheel" ];
      initialPassword = "hunter2";
    };
  };
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "miabread" = import ./home.nix; };
    useGlobalPkgs = true;
  };

  # Secrets management
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/miabread/.config/sops/age/keys.txt";

    secrets.git-credentials.owner = "miabread";
  };

  # Persistence using impermanence
  environment.persistence."/nix/persist" = {
    directories = [ "/etc/nixos" "/var/lib" "/var/log" "/srv" "/data" ];
    files = [ "/etc/machine-id" ];
    users.miabread = {
      directories = [ ".local/share/fish" ];
      files = [ ".bash_history" ".config/sops/age/keys.txt" ];
    };
  };

  # Core system components
  boot.loader.systemd-boot.enable = true;
  networking.hostName = "daedalus";
  networking.hostId = "f0e87880"; # For zfs -mia
  networking.networkmanager.enable = true;
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  # Nixos core options
  system.stateVersion = "25.05"; # Do not change from first install
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

