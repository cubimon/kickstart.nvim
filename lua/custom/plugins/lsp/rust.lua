if vim.fn.executable('rust-analyzer') == 1 then
  vim.lsp.enable('rust_analyzer')
end

