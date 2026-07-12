vim.pack.add {
  {
    src = 'https://github.com/akinsho/toggleterm.nvim',
  }
}
vim.cmd [[packadd toggleterm.nvim]]
require('toggleterm').setup {
  open_mapping = [[<c-\>]], -- Use Ctrl + \ to toggle
  direction = 'float', -- Makes it a floating window
  float_opts = {
    border = 'curved',
    -- Make it almost fill the screen (0.9 = 90%)
    width = function() return math.ceil(vim.o.columns) end,
    height = function() return math.ceil(vim.o.lines) end,
    winblend = 3,
  },
}
