return {
  "yochem/jq-playground.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = {
    "JqPlayground",
    "JqPlaygroundQuery",
  },
  config = function()
    require("jq-playground").setup()
  end,
}

