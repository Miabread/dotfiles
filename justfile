default:
  just --list

switch:
  sudo nixos-rebuild switch

test:
  sudo nixos-rebuild test

boot:
  sudo nixos-rebuild boot

search:
  sudo rsync -amvxx --dry-run --no-links --exclude '/tmp/*' --exclude '/root/*' --exclude '/home/miabread/.cache/*'  / /nix/persist | rg -v '^skipping|/$'
