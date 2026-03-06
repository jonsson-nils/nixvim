{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    vimPlugins.friendly-snippets
    nixfmt
    wl-clipboard
    tailwindcss-language-server
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

  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "ansi-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "0xferrous";
        repo = "ansi.nvim";
        rev = "main"; # Use a commit hash for reproducibility
        sha256 = "sha256-Kv7xDWqKbF0jVtGZDRYDoN7UVl22E/If3vRHMmQAmNA="; # Replace with actual hash
      };
    })
  ];

  # Initialize the plugin in Lua
  extraConfigLua = ''
    require("ansi").setup({
      auto_enable = true,     -- Automatically color logs if desired
      filetypes = { "log" },  -- Target the filetype we set in the tmux binding
    })
  '';
}
