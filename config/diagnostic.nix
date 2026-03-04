{ ... }:
{
  settings = {
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
    virtual_text = false;
    virtual_lines = true;
  };
}
