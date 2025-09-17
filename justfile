_default:
  just --list

# Rebuild and create boot entry
switch:
  sudo nixos-rebuild switch

# Rebuild but don't create boot entry
test:
  sudo nixos-rebuild test

# Rebuild but don't use until next reboot
boot:
  sudo nixos-rebuild boot

# Update all flake inputs
update:
  sudo nix flake update

# Search for files not marked for persistent (daedalus with impermanence)
search-persist:
  sudo rsync -amvxx --dry-run --no-links --exclude '/tmp/*' --exclude '/root/*' --exclude '/home/miabread/.cache/*'  / /nix/persist | rg -v '^skipping|/$'

# Search for files moved to backup (lilac with home-manager)
search-backup:
  find /home/miabread -type f -name "*.backup" -not -path "/home/miabread/Storage/*"

# Edit the secrets file
secrets:
  sops ./secrets/secrets.yaml

# Remove generations older than 2 weeks
garbage:
    nix-collect-garbage --delete-older-than 14d
    echo "Reminder: Rebuild nixos after to update bootloader entires"
