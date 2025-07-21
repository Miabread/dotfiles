{ pkgs, ... }:

{
  # Packages required to use this repo's justfile
  environment.systemPackages = with pkgs; [ just ripgrep rsync sops ];
}
