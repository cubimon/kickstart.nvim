vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
  init_options = {
    -- Fall back to Mason's typescript library if not found in the workspace
    tsserver = {
      --fallbackPath = vim.fn.stdpath("data") .. "/mason/packages/typescript-language-server/node_modules/typescript/lib",
      path = "/usr/lib/node_modules/typescript/lib"
    },
  },
})

-- Enable it
vim.lsp.enable("ts_ls")

