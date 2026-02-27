{ ... }:
{
  wrap = false;
  clipboard = "unnamedplus";

  tabstop = 2;
  shiftwidth = 2;
  expandtab = true;
  softtabstop = 2;
  shiftround = true;

  # --- General ---
  number = true; # Show line numbers
  relativenumber = true; # Relative line numbers for easier jumping
  undofile = true; # Persistent undo history
  updatetime = 200; # Faster completion and diagnostic popups
  cursorline = true; # Highlight the current line

  # --- Search ---
  ignorecase = true; # Ignore case in search patterns
  smartcase = true; # Smart case (case-sensitive if capital is used)

  # --- Appearance ---
  termguicolors = true; # Enable 24-bit RGB colors
  signcolumn = "yes"; # Always show the sign column to prevent "flickering"
  laststatus = 3; # Global statusline (Standard in modern Neovim)
}
