{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell { packages = with pkgs; [ nil nixfmt-classic ]; }
