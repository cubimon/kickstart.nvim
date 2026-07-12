vim.pack.add {
  {
    src = 'https://github.com/declancm/maximize.nvim',
  }
}
vim.cmd [[packadd maximize.nvim]]
require('maximize').setup {
  vim.keymap.set('n', '<leader>m', function()
  require('maximize').toggle()
  end, { desc = '[M]aximize current split' })
}
