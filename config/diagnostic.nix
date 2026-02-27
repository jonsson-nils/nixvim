{ ... }:
{
  settings = {
    # LazyVim uses specific symbols for a cleaner gutter
    signs = {
      text = {
        "__raw" = ''
          {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.HINT]  = " ",
            [vim.diagnostic.severity.INFO]  = " ",
          }'';
      };
    };
    # Show diagnostic source (e.g., "nixd") in the hover popup
    virtual_text = {
      spacing = 4;
      prefix = "●";
      source = "if_many";
    };
  };
}
