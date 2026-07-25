if vim.fn.executable('basedpyright') == 1 then
  vim.lsp.config('basedpyright', {
    settings = {
      basedpyright = {
        analysis = {
          typeCheckingMode = 'basic', -- or "standard" / "strict"
        }
      },
    },
  })
  vim.lsp.enable('basedpyright')
end

