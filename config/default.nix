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

  extraConfigLua = ''
    local ns = vim.api.nvim_create_namespace("source_only_rulers")

    vim.api.nvim_set_hl(0, "RulerSoft", { fg = "#8F6F41", default = true })
    vim.api.nvim_set_hl(0, "RulerHard", { fg = "#7D4A4A", default = true })

    -- Define custom limits here
    local ft_limits = {
      gitcommit = { soft = 50, hard = 72 },
      jjdescription = { soft = 50, hard = 72 },
      default = { soft = 80, hard = 120 }
    }

    local function draw_custom_rulers()
      local bufnr = vim.api.nvim_get_current_buf()
      local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })
      if buftype ~= "" then return end

      local ft = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
      
      local excluded_ft = { "markdown", "help" }
      for _, v in ipairs(excluded_ft) do
        if ft == v then return end
      end

      -- Get limits for current FT or use defaults
      local limits = ft_limits[ft] or ft_limits.default

      vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
      local line_count = vim.api.nvim_buf_line_count(bufnr)
      
      for i = 0, line_count - 1 do
        -- Soft Marker
        vim.api.nvim_buf_set_extmark(bufnr, ns, i, 0, {
          virt_text = {{ "┆", "RulerSoft" }},
          virt_text_pos = "overlay",
          virt_text_win_col = limits.soft,
          priority = 1,
        })
        -- Hard Marker
        vim.api.nvim_buf_set_extmark(bufnr, ns, i, 0, {
          virt_text = {{ "┆", "RulerHard" }},
          virt_text_pos = "overlay",
          virt_text_win_col = limits.hard,
          priority = 2,
        })
      end
    end

    vim.api.nvim_create_autocmd({ "BufWinEnter", "WinScrolled" }, {
      callback = draw_custom_rulers,
    })

  '';
}
