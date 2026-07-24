vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/kdheepak/lazygit.nvim'
}

vim.g.lazygit_floating_window_scaling_factor = 1.0
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Toggle LazyGit" })

