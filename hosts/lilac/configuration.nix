# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./stylix.nix
    ../../nixos/hyprland.nix
    ../../nixos/just.nix
  ];

  # Create main user and connect home-manager
  users = {
    mutableUsers = false;

    users.root = {
      hashedPasswordFile = config.sops.secrets.lilac-password.path;
    };

    users.miabread = {
      isNormalUser = true;
      description = "Miabread";
      extraGroups = [ "networkmanager" "wheel" ];
      hashedPasswordFile = config.sops.secrets.lilac-password.path;
    };
  };
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "miabread" = import ./home.nix; };
    backupFileExtension = "backup";
    useGlobalPkgs = true;
  };

  # Secrets management
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/miabread/.config/sops/age/keys.txt";

    secrets = {
      lilac-password.neededForUsers = true;
      git-credentials.owner = "miabread";
    };
  };

  # Core system components
  boot.loader = {
    timeout = null;
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
  };
  networking.hostName = "lilac";
  networking.networkmanager.enable = true;
  time.timeZone = "America/New_York";
  time.hardwareClockInLocalTime = true;
  i18n.defaultLocale = "en_US.UTF-8";

  # Nixos core options
  system.stateVersion = "24.05"; # Do not change from first install
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
