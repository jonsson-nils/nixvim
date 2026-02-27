{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    vimPlugins.friendly-snippets
    nixfmt
    wl-clipboard
  ];

  globals.mapleader = " ";
  globals.maplocalleader = " ";

  colorschemes.tokyonight = {
    enable = true;
    settings.style = "storm";
  };

  opts = import ./opts.nix { inherit pkgs; };
  diagnostic = import ./diagnostic.nix { inherit pkgs; };
  keymaps = import ./keymaps.nix { inherit pkgs; };
  plugins = import ./plugins { inherit pkgs; };
}
