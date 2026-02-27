{ pkgs, ... }:
{
  web-devicons.enable = true;

  treesitter = {
    enable = true;
    settings = {
      highlight.enable = true;
      indent.enable = true;
    };
  };

  which-key = {
    enable = true;
    # Optional: styling and settings
    settings = {
      delay = 100;

      win = {
        border = "single"; # Options: "none", "single", "double", "shadow"
      };

      spec = [
        {
          __unkeyed-1 = "<leader>b";
          group = "Buffer";
        }
        {
          __unkeyed-1 = "<leader>c";
          group = "Code";
        }
        {
          __unkeyed-1 = "<leader>f";
          group = "File/Find";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "Git";
        }
        {
          __unkeyed-1 = "<leader>w";
          group = "Window";
        }
        {
          __unkeyed-1 = "<leader>gh";
          group = "Hunks";
        }
        {
          __unkeyed-1 = "<leader>q";
          group = "Quit/Session";
        }
        {
          __unkeyed-1 = "<leader>s";
          group = "Search";
        }
        {
          __unkeyed-1 = "<leader>u";
          group = "UI";
        }
        {
          __unkeyed-1 = "<leader>z";
          group = "Zen";
        }
        {
          __unkeyed-1 = "gs";
          group = "Surround";
          icon = "   ";
        }
      ];
    };
  };

  trouble.enable = true;

  gitsigns = {
    enable = true;
    settings = {
      current_line_blame = true; # Shows "who did this" next to the cursor
      trouble = true; # Integrates with trouble.nvim if you use it
      signs = {
        add.text = "┃";
        change.text = "┃";
        delete.text = "_";
        topdelete.text = "‾";
        changedelete.text = "~";
        untracked.text = "┆";
      };
    };
  };

  telescope = {
    enable = true;
    # Git-specific built-ins are enabled by default with telescope
    keymaps = {
      "<leader>gc" = {
        action = "git_commits";
        options.desc = "Search Git Commits";
      };
      "<leader>gb" = {
        action = "git_branches";
        options.desc = "Search Git Branches";
      };
      "<leader>gs" = {
        action = "git_status";
        options.desc = "Search Git Status (Diff)";
      };
    };
  };

  blink-cmp = {
    enable = true;
    settings = {
      keymap.preset = "default";

      snippets.preset = "luasnip";

      sources.default = [
        "lsp"
        "path"
        "snippets"
        "buffer"
      ];

      appearance = {
        use_nvim_cmp_as_default = true;
        nerd_font_variant = "mono";
      };

      completion = {
        documentation.auto_show = true;
        ghost_text.enabled = true;
      };
    };
  };

  lsp = {
    enable = true;
    inlayHints = true;
    onAttach = ''
      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end
    '';
    servers = {
      # Rust: Uses rust-analyzer
      rust_analyzer = {
        enable = true;
        installCargo = false; # Let Nix manage cargo/rustc
        installRustc = false;
        settings = {
          diagnostics.enable = true;
          procMacro.enable = true;
          checkOnSave = {
            command = "check";
            enable = true;
          };
          cargo = {
            loadOutDirsFromCheck = true;
            allFeatures = true;
            extraEnv = {
              CARGO_TARGET_DIR = "target/analyzer";
            };
          };
        };
      };

      # Nix: Uses nixd (highly recommended for flakes)
      nixd.enable = true;

      # Lua: Uses lua-ls
      lua_ls.enable = true;

      # Tailwind: Uses tailwindcss-language-server
      tailwindcss.enable = true;
    };
  };

  luasnip = {
    enable = true;
    fromVscode = [ { } ];
  };

  oil = {
    enable = true;
  };

  # --- UI & Status ---
  lualine = {
    enable = true;
    settings.options.theme = "tokyonight"; # Matches your theme
  };

  fidget.enable = true; # LSP progress notifications

  bufferline = {
    enable = true;
    settings.options = {
      separator_style = "slant"; # Clean visual tabs
      offsets = [
        {
          filetype = "oil";
          text = "File Explorer";
          highlight = "Directory";
          text_align = "left";
        }
      ];
    };
  };

  # --- Git Tools ---
  diffview.enable = true;
  fugitive.enable = true;

  # --- Productivity & Utilities ---
  undotree = {
    enable = true;
    settings = {
      FocusOnOpen = true;
      WindowLayout = 2;
    };
  };

  hop = {
    enable = true;
    settings.keys = "etovxqpdygfblzhckisuran"; # Home row priority
  };

  noice = {
    enable = true;
    settings = {
      lsp.override = {
        "vim.lsp.util.convert_input_to_markdown_lines" = true;
        "vim.lsp.util.stylize_markdown" = true;
        "cmp.entry.get_documentation" = true;
      };
      presets = {
        bottom_search = true; # classic bottom search bar
        command_palette = true; # center floating command bar
        long_message_to_split = true;
        inc_rename = false; # enable if you use inc-rename.nvim
      };
    };
  };

  # Required UI dependencies for Noice
  nui.enable = true;
  notify.enable = true;

  mini = {
    enable = true;
    modules = {
      pairs = {
        # Use default settings for smart closing
        modes = {
          insert = true;
          command = true;
          terminal = false;
        };
        # Skip autopair if the next character is not whitespace
        markdown = true;
      };

      ai = {
        n_lines = 500;
      };

      surround = {
        mappings = {
          add = "gsa";
          delete = "gsd";
          find = "gsf";
          find_left = "gsF";
          highlight = "gsh";
          replace = "gsr";
          update_n_lines = "gsn";
        };
      };
    };
  };

  # --- Distraction-Free Writing ---
  zen-mode = {
    enable = true;
    settings = {
      window = {
        backdrop = 0.95; # shadow the background (0 to 1)
        width = 120; # width of the centered window
        height = 1; # height of the centered window (1 = 100%)
        options = {
          signcolumn = "no";
          number = false;
          relativenumber = false;
          cursorline = false;
          cursorcolumn = false;
          foldcolumn = "0";
          list = false;
        };
      };
      plugins = {
        # Integrates with your other plugins
        gitsigns.enabled = false;
        tmux.enabled = false;
        twilight.enabled = true; # Dims inactive lines
      };
    };
  };

  # Companion plugin for dimming inactive code
  twilight.enable = true;

  persistence = {
    enable = true;
    settings = {
      dir.__raw = "vim.fn.expand(vim.fn.stdpath('state') .. '/sessions/')"; # Standard session location
      options = [
        "buffers"
        "curdir"
        "tabpages"
        "winsize"
        "help"
        "globals"
        "skiprtp"
      ];
    };
  };

  snacks = {
    enable = true;
    settings = {
      dashboard = {
        enabled = true;
        sections = [
          { section = "header"; }
          {
            section = "keys";
            gap = 1;
            padding = 1;
          }
          # { section = "startup"; }
        ];
        # Customizing the centered "keys" (LazyVim style)
        preset = {
          header = ''
            ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
            ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║
            ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║
            ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
            ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
            ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
          '';
          keys = [
            {
              icon = " ";
              key = "f";
              desc = "Find File";
              action = ":Telescope find_files";
            }
            {
              icon = " ";
              key = "n";
              desc = "New File";
              action = ":ene | startinsert";
            }
            {
              icon = " ";
              key = "c";
              desc = "Config";
              action = ":Oil .";
            }
            {
              icon = " ";
              key = "s";
              desc = "Restore Session";
              action = ''lua require("persistence").load()'';
            }
            {
              icon = " ";
              key = "q";
              desc = "Quit";
              action = ":qa";
            }
          ];
        };
      };
      # Bonus: Smooth animations and scope lines
      indent.enabled = true;
      notifier.enabled = true;
      scope.enabled = true;
      scroll.enabled = true;
    };
  };

  todo-comments = {
    enable = true;
    settings = {
      # Allow lowercase by using the case-insensitive flag (?i)
      highlight = {
        # This regex finds the keywords anywhere in the comment
        pattern = ''[^\w](?i)(KEYWORDS):'';
      };
      search = {
        # This ensures ripgrep (used by Telescope) also ignores case
        args = [
          "--color=never"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--ignore-case" # Critical for finding lowercase "todo"
        ];
        pattern = ''\b(?i)(KEYWORDS):'';
      };
    };
  };

  treesitter-context = {
    enable = true;
    settings = {
      max_lines = 3; # Don't let it take over the screen
      min_window_height = 0;
      line_numbers = true;
      multiline_threshold = 1;
      trim_scope = "outer";
    };
  };

  # --- Modern Window Management ---
  edgy = {
    enable = true;
    settings = {
      bottom = [
        {
          ft = "toggleterm";
          size = 15;
          title = "Terminal";
        }
        {
          ft = "trouble";
          title = "Trouble";
        }
      ];
      left = [
        {
          ft = "outline";
          pinned = true;
          open = "Outline";
          title = "Outline";
        }
      ];
    };
  };

  # --- Smooth Cursor (No Smear) ---
  smear-cursor = {
    enable = true;
    settings = {
      # Disabling the smear/tail for a clean "smooth glide"
      smear_between_buffers = false;
      smear_between_lines = false;
      # Adjusting the spring for a snappier feel
      stiffness = 0.8;
      trailing_stiffness = 0.5;
    };
  };

  octo = {
    enable = true;
    settings = {
      enable_builtin = true; # Uses telescope for pickers
      default_remote = [
        "upstream"
        "origin"
      ];
      ssh_only = true; # Recommended for Nix/SSH setups
    };
  };

  # --- The Modern LazyVim Jump Plugin ---
  flash = {
    enable = true;
    settings = {
      labels = "asdfghjklqwertyuiopzxcvbnm";
      search = {
        # Use same logic as LazyVim (automatic jump on 1 char)
        mode = "exact";
      };
      jump = {
        autojump = true;
      };
      label = {
        uppercase = false;
        # Style labels to match TokyoNight theme
        style = "overlay";
      };
    };
  };

  conform-nvim = {
    enable = true;
    settings = {
      # LazyVim formats on save by default
      format_on_save = {
        lsp_fallback = true;
        timeout_ms = 500;
      };
      formatters_by_ft = {
        nix = [ "nixfmt" ]; # Requires pkgs.nixfmt-rfc-style
        rust = [ "rustfmt" ];
        lua = [ "stylua" ];
        javascript = [
          "prettierd"
          "prettier"
        ];
      };
    };
  };
}
