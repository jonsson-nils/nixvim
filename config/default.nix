{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    nixfmt
    wl-clipboard
  ];

  globals.mapleader = " ";
  globals.maplocalleader = " ";

  colorschemes.tokyonight = {
    enable = true;
    settings.style = "storm";
  };

  opts = import ./opts.nix { };
  diagnostic = import ./diagnostic.nix { };
  keymaps = import ./keymaps.nix { };
  plugins = import ./plugins { };
}
