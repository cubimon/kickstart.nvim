local jdtls = require 'jdtls'
local mason_path = vim.fn.stdpath 'data' .. '/mason/packages'

-- bundles from dap/test
local bundles = {}
-- 1. Debug Adapter (Find the jar)
local debug_jar = vim.fn.glob(mason_path .. '/java-debug-adapter/extension/server/*.jar', true)
if debug_jar ~= '' then
  table.insert(bundles, debug_jar)
end
-- 2. Test Runner (Find all jars in the server folder)
local test_jars = vim.fn.glob(mason_path .. '/java-test/extension/server/*.jar', true)
for _, jar in ipairs(vim.split(test_jars, '\n')) do
  if jar ~= '' then
    table.insert(bundles, jar)
  end
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath 'cache' .. '/jdtls/workspace/' .. project_name

-- 2. Capabilities (Handle the missing module safely)
local capabilities = vim.lsp.protocol.make_client_capabilities()
local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if status_ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

local config = {
  cmd = {
    'jdtls', -- Make sure you installed this via :Mason
    '-data',
    workspace_dir,
  },
  root_dir = jdtls.setup.find_root { '.git', 'mvnw', 'gradlew', 'pom.xml' },
  capabilities = capabilities,
  settings = {
    java = {
      contentProvider = { preferred = 'fernflower' }, -- Use the fernflower decompiler
    },
  },
  init_options = {
    bundles = bundles,
  },

  -- 3. Keymaps
  on_attach = function(client, bufnr)
    -- 1. This must come BEFORE any DAP commands
    require('jdtls').setup_dap { hotcodereplace = 'auto' }

    -- 2. This specifically addresses the 'resolveMainClass' error
    -- It tells the server to look for main methods now that the bundles are loaded
    require('jdtls.dap').setup_dap_main_class_configs()

    -- jdtls.setup_dap { hotcodereplace = 'auto' }
    local map = function(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = bufnr, desc = 'Java: ' .. desc })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Go to Definition' })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover Documentation' })
    end

    -- Java specific extras
    map('n', '<leader>co', jdtls.organize_imports, 'Organize Imports')
    map('n', '<leader>cv', jdtls.extract_variable, 'Extract Variable')
    map('n', '<leader>cc', jdtls.extract_constant, 'Extract Constant')
    map('n', '<leader>dn', jdtls.test_nearest_method, 'Test Method')

    -- Running & Testing
    map('n', '<leader>df', jdtls.test_class, 'Test Class')
    map('n', '<leader>dn', jdtls.test_nearest_method, 'Test Nearest Method')

    -- Standard DAP Keymaps (assumes you have nvim-dap installed)
    -- local dap = require 'dap'
    -- map('n', '<leader>db', dap.toggle_breakpoint, 'Toggle Breakpoint')
    -- map('n', '<F5>', dap.continue, 'Debug/Continue')

    -- If you want to use your standard Kickstart keymaps (gd, gr, etc.)
    -- and they are defined in a global function in init.lua, call it here.
  end,
}

-- This starts the server
jdtls.start_or_attach(config)
