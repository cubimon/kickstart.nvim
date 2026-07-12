vim.pack.add {
  {
    src = 'https://github.com/yochem/jq-playground.nvim'
  }
}
vim.cmd [[packadd jq-playground.nvim]]
require("jq-playground").setup()

