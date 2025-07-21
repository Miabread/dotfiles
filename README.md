# 🥕 Miabread/dotfiles 🐇

The monorepo of my various config files for my various computers. Mainly managed by nixos and home-manager.

## Overview

If you're looking for something specific, this section might help.

### Configs of Note

- [Neovim](/home-manager/nvim)
- [Hyprland](/hosts/lilac/home-manager/desktop/hyprland.nix)
- [Vscode (old)](/hosts/lilac/home-manager/dev/vscode.nix)

### Structure

| Folder                            | Purpose                                        |
| --------------------------------- | ---------------------------------------------- |
| [`/hosts/`](/hosts)               | Individual machine configurations              |
| [`/nixos/`](/nixos)               | OS configuration files                         |
| [`/home-manager/`](/home-manager) | All home dotfiles, most things will be in here |
| [`/secrets/`](/secrets)           | Secrets managed by sops-nix                    |

Note [`lilac` has some modules](/hosts/lilac) that haven't been refactored into the new structure yet. This is on the TODO list.

### Hosts

| Hostname                               | OS        | Purpose          |
| -------------------------------------- | --------- | ---------------- |
| [`lilac`](/hosts/lilac)                | Nixos     | Personal laptop  |
| `tulip`                                | Android   | Personal phone   |
| `lily`                                 | Proxmox   | Home server      |
| `lily` / [`daedalus`](/hosts/daedalus) | Nixos VM  | General services |
| `lily` / `duskbreaker`                 | Debian VM | Networking       |



## Laptop "lilac" Hyprland Keybindings

Section dedicated to the readme file pre-multi-machine refactor. You can find the  code for reference in the [Hyprland](/hosts/lilac/home-manager/desktop/hyprland.nix) config.

### Workspaces (ASDXC)

Layout that allows managing workspaces with minimal left hand reach.

Each workspace is dedicated to an application I use often.

| Key | Purpose   |
| --- | --------- |
| A   | Browser   |
| S   | Editor    |
| D   | Notes     |
| X   | Messaging |
| C   | Music     |

### Key Bindings

Implemented at a window manager level.

If lost, press Ctrl + Slash to bring up this file.

| Modifier         | Key             | Action               |
| ---------------- | --------------- | -------------------- |
| Super Ctrl       | Q               | Close window         |
| Super Ctrl       | W               | Terminal             |
| Super Ctrl       | ASDXC           | Launch workspace app |
| Super            | ASDXC           | Switch to workspace  |
| Super Shift      | ASDXC           | Send to workspace    |
| Super            | Arrows          | Move focus           |
| Super            | Scroll          | Scroll workspaces    |
| Super            | Left Mouse      | Move window          |
| Super            | Right Mouse     | Resize window        |
| Super            | Backspace       | Lock                 |
| Super Ctrl       | Backspace       | Shutdown             |
| Super Ctrl Shift | Backspace       | Reboot               |
| Super Ctrl Shift | M               | Exit desktop         |
| Super            | Tab             | Toggle launcher      |
| Super            | Grave           | Toggle status bar    |
| Super            | F               | Toggle floating      |
| Super            | Slash           | Quick open dotfiles  |
|                  | Brightness Down | Decrease brightness  |
|                  | Brightness Up   | Increase brightness  |
| Ctrl             | Brightness Down | Night filter on      |
| Ctrl             | Brightness Up   | Night filter off     |
|                  | Print           | Screenshot selection |
| Ctrl             | Print           | Screenshot screen    |

### Applications

Table has major applications but not everything.

| Purpose        | Name                     |
| -------------- | ------------------------ |
| Terminal       | Alacritty                |
| Browser        | Firefox                  |
| Editor         | Visual Studio Code       |
| Notes          | Obsidian                 |
| Messaging      | Discord (Vesktop Client) |
| Music          | null                     |
| Shell          | Zsh                      |
| Shell Prompt   | Starship                 |
| Window Manager | Hyprland                 |
| Status Bar     | Waybar                   |
| Launcher       | Wofi                     |
| Notifier       | Mako                     |
| Distro         | Nixos                    |
