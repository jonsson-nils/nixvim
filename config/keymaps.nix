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
  {
    mode = "n";
    key = "<leader>fg";
    action = "<cmd>Telescope live_grep<cr>";
    options.desc = "Grep (Root)";
  }

  # --- Code / LSP (<leader>c) ---
  {
    mode = "n";
    key = "<leader>cd";
    action = "<cmd>lua vim.diagnostic.open_float()<cr>";
    options.desc = "Line Diagnostics";
  }
  {
    mode = "n";
    key = "<leader>ca";
    action = "<cmd>lua vim.lsp.buf.code_action()<cr>";
    options.desc = "Code Action";
  }
  {
    mode = "n";
    key = "<leader>cr";
    action = "<cmd>lua vim.lsp.buf.rename()<cr>";
    options.desc = "Rename";
  }

  # --- UI / Toggles (<leader>u) ---
  {
    mode = "n";
    key = "<leader>uf";
    action = "<cmd>lua require('conform').format()<cr>";
    options.desc = "Format Document";
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
    key = "<leader>bd";
    action = "<cmd>bdelete<cr>";
    options.desc = "Delete Buffer";
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

  # --- Search / Todo (<leader>s) ---
  {
    mode = "n";
    key = "<leader>st";
    action = "<cmd>TodoTelescope<cr>";
    options.desc = "Todo (Telescope)";
  }
  {
    mode = "n";
    key = "<leader>sn";
    action = "<cmd>Noice<cr>";
    options.desc = "Noice Messages";
  }
  {
    mode = [
      "n"
      "x"
      "o"
    ];
    key = "s";
    action = ''<cmd>lua require("flash").jump()<cr>'';
    options.desc = "Flash";
  }
  {
    mode = [
      "n"
      "x"
      "o"
    ];
    key = "S";
    action = ''<cmd>lua require("flash").treesitter()<cr>'';
    options.desc = "Flash Treesitter";
  }
  {
    mode = "o";
    key = "r";
    action = ''<cmd>lua require("flash").remote()<cr>'';
    options.desc = "Remote Flash";
  }
  {
    mode = [
      "x"
      "o"
    ];
    key = "R";
    action = ''<cmd>lua require("flash").treesitter_search()<cr>'';
    options.desc = "Treesitter Search";
  }
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
    key = "<leader>wd";
    action = "<C-w>c";
    options.desc = "Close Window";
  }
]
