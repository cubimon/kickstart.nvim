vim.pack.add {
  {
    src = 'https://github.com/akinsho/toggleterm.nvim',
  }
}
vim.cmd [[packadd toggleterm.nvim]]

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "none",
    width = function()
      return vim.o.columns
    end,
    height = function()
      return vim.o.lines
    end,
  },
  hidden = true, -- Keeps the process alive in the background when hidden
  on_open = function(term)
    vim.cmd("startinsert!")
    -- Ensures <Esc> acts inside LazyGit (for navigating menus) rather than escaping Neovim terminal mode
    vim.keymap.set("t", "<Esc>", "<Esc>", { buffer = term.bufnr, nowait = true })
  end,
})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

-- Map Alt+g (<A-g>) to toggle in both Normal (n) and Terminal (t) modes
vim.keymap.set({ "n", "t" }, "<A-g>", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {
  noremap = true,
  silent = true,
  nowait = true,
  desc = "Toggle LazyGit",
})

