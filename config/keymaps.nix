{ ... }:
[
  {
    mode = [
      "n"
      "v"
    ];
    key = "<Space>";
    action = "<Nop>";
    options.silent = true;
  }

  {
    mode = [
      "n"
    ];
    key = "<leader><leader>";
    action = "<cmd>Telescope<cr>";
  }

  # --- Improved scrolling ---
  {
    mode = "n";
    key = "<C-d>";
    action = "<C-d>zz";
    options.desc = "Scroll Down and Center";
  }
  {
    mode = "n";
    key = "<C-u>";
    action = "<C-u>zz";
    options.desc = "Scroll Up and Center";
  }
  {
    mode = "n";
    key = "n";
    action = "nzzzv";
    options.desc = "Next search result (centered)";
  }
  {
    mode = "n";
    key = "N";
    action = "Nzzzv";
    options.desc = "Previous search result (centered)";
  }

  # --- File / Find (<leader>f) ---
  {
    mode = "n";
    key = "<leader>ff";
    action = "<cmd>Telescope find_files<cr>";
    options.desc = "Find Files";
  }
  {
    mode = "n";
    key = "<leader>fr";
    action = "<cmd>Telescope oldfiles<cr>";
    options.desc = "Recent";
  }

  # --- Code / LSP (<leader>c) ---
  {
    mode = "n";
    key = "<leader>cd";
    action.__raw = "vim.diagnostic.open_float";
    options.desc = "Line Diagnostics";
  }
  {
    mode = "n";
    key = "<leader>ca";
    action.__raw = "vim.lsp.buf.code_action";
    options.desc = "Code Action";
  }
  {
    mode = "n";
    key = "<leader>cr";
    action.__raw = "vim.lsp.buf.rename";
    options.desc = "Rename";
  }
  {
    mode = "n";
    key = "<leader>cf";
    action.__raw = "require('conform').format";
    options.desc = "Format Document";
  }

  # Git
  {
    mode = "n";
    key = "<leader>gg";
    action = "<cmd>Git<cr>";
    options.desc = "Git";
  }

  # Zen
  {
    mode = "n";
    key = "<leader>zz";
    action = "<cmd>ZenMode<cr>";
    options.desc = "Enter Zen";
  }

  # --- UI / Toggles (<leader>u) ---
  {
    mode = "n";
    key = "<leader>un";
    action = "<cmd>Noice<cr>";
    options.desc = "Noice Messages";
  }
  {
    mode = "n";
    key = "<leader>us";
    action = "<cmd>set spell!<cr>";
    options.desc = "Toggle Spelling";
  }
  {
    mode = "n";
    key = "<leader>uw";
    action = "<cmd>set wrap!<cr>";
    options.desc = "Toggle Word Wrap";
  }
  {
    mode = "n";
    key = "<leader>ul";
    action = "<cmd>set relativenumber!<cr>";
    options.desc = "Toggle Relative Line Numbers";
  }

  # --- Buffers ---
  {
    mode = "n";
    key = "<leader>bb";
    action = "<cmd>Telescope buffers<cr>";
    options.desc = "Buffers";
  }
  {
    mode = "n";
    key = "<leader>bw";
    action = "<cmd>w<cr>";
    options.desc = "Write Buffer";
  }
  {
    mode = "n";
    key = "<leader>bq";
    action = "<cmd>bdelete<cr>";
    options.desc = "Close Buffer";
  }
  {
    mode = "n";
    key = "<leader>bj";
    action = "<cmd>bprevious<cr>";
    options.desc = "Previous Buffer";
  }
  {
    mode = "n";
    key = "<leader>bk";
    action = "<cmd>bnext<cr>";
    options.desc = "Next Buffer";
  }

  # Windows
  {
    mode = "n";
    key = "<leader>wh";
    action = "<C-w>h";
    options.desc = "Go to Left Window";
  }
  {
    mode = "n";
    key = "<leader>wj";
    action = "<C-w>j";
    options.desc = "Go to Lower Window";
  }
  {
    mode = "n";
    key = "<leader>wk";
    action = "<C-w>k";
    options.desc = "Go to Upper Window";
  }
  {
    mode = "n";
    key = "<leader>wl";
    action = "<C-w>l";
    options.desc = "Go to Right Window";
  }
  {
    mode = "n";
    key = "<leader>wv";
    action = "<C-w>v";
    options.desc = "Split Window Vertically";
  }
  {
    mode = "n";
    key = "<leader>ws";
    action = "<C-w>s";
    options.desc = "Split Window Horizontally";
  }
  {
    mode = "n";
    key = "<leader>wq";
    action = "<C-w>c";
    options.desc = "Close Window";
  }

  # --- Search / Todo (<leader>s) ---
  {
    mode = "n";
    key = "<leader>sg";
    action = "<cmd>Telescope live_grep<cr>";
    options.desc = "Grep (Root)";
  }
  {
    mode = "n";
    key = "<leader>st";
    action = "<cmd>TodoTelescope<cr>";
    options.desc = "Todo (Telescope)";
  }

  # --- Jumps with flash.nvim ---
  {
    mode = [
      "n"
      "x"
      "o"
    ];
    key = "s";
    action.__raw = ''require("flash").jump'';
    options.desc = "Flash";
  }
  {
    mode = [
      "n"
    ];
    key = "S";
    action.__raw = ''require("flash").treesitter'';
    options.desc = "Flash Treesitter";
  }
  {
    mode = "o";
    key = "r";
    action.__raw = ''require("flash").remote'';
    options.desc = "Remote Flash";
  }
  {
    mode = [
      "x"
      "o"
    ];
    key = "S";
    action.__raw = ''
      function()
        require("flash").treesitter_search({
          remote_op = {
            restore = true,
            motion = true,
          }
        })
      end
    '';
    options.desc = "Treesitter Search";
  }
]
