vim.pack.add {
  {
    src = 'https://github.com/yochem/jq-playground.nvim'
  }
}
vim.cmd [[packadd jq-playground.nvim]]
require("jq-playground").setup()

vim.keymap.set("n", "<leader>jq", vim.cmd.JqPlayground, { desc = "Open JQ Playground" })
