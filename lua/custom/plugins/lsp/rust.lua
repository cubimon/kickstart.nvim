if vim.fn.executable('rust-analyzer') == 1 then
  vim.lsp.enable('rust_analyzer')
end

local dap = require("dap")

dap.configurations.rust = {
  {
    name = "Run/Debug Active Package",
    type = "codelldb",
    request = "launch",
    program = function()
      -- 1. Build the cargo project automatically before debugging
      vim.notify("Building Cargo target...", vim.log.levels.INFO)
      vim.fn.system("cargo build --message-format=json")

      -- 2. Derive the project binary name from Cargo.toml or directory name
      local cwd = vim.fn.getcwd()
      local project_name = vim.fn.fnamemodify(cwd, ":t")
      local binary_path = cwd .. "/target/debug/" .. project_name

      if vim.fn.executable(binary_path) == 1 then
        return binary_path
      else
        -- Fallback: ask for path if auto-detection fails
        return vim.fn.input("Executable path: ", cwd .. "/target/debug/", "file")
      end
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

