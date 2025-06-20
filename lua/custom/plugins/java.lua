return {}
--  'nvim-java/nvim-java',
--  ft = 'java',
--  --dependencies = {
--  --  'nvim-java/lua-async-await',
--  --  'nvim-java/nvim-java-core',
--  --  'nvim-java/nvim-java-test',
--  --  'nvim-java/nvim-java-refactor',
--  --  'nvim-java/nvim-java-dap',
--  --  'mfussenegger/nvim-dap',
--  --  'neovim/nvim-lspconfig',
--  --  'williamboman/mason.nvim',
--  --},
--  --config = function()
--  --  require('java').setup {
--  --    jdtls = {
--  --      version = '1.46.1',
--  --    },
--  --    --test = {
--  --    --  enable = true,
--  --    --},
--  --  }
--  --end,
--}
--{
--  'nvim-java/nvim-java',
--  dependencies = {
--    {
--      'nvim-java/nvim-java-core',
--      config = function()
--        require('java-core').setup {}
--      end,
--    },
--    {
--      'nvim-java/nvim-java-test',
--      config = function()
--        require('java-test').setup {}
--      end,
--    },
--    {
--      'nvim-java/nvim-java-dap',
--      config = function()
--        require('java-dap').setup {}
--      end,
--    },
--    {
--      'nvim-java/nvim-java-refactor',
--      config = function()
--        require('java-refactor').setup {}
--      end,
--    },
--    'mfussenegger/nvim-dap',
--    'neovim/nvim-lspconfig',
--    'williamboman/mason.nvim',
--  },
--  config = function()
--    require('java').setup {
--      jdtls = {
--        version = '1.46.1',
--      },
--      test = {
--        enable = true,
--      },
--    }
--
--    local dap = require 'dap'
--    dap.adapters.java = function(callback)
--      require('java.dap').setup_dap_main_class_configs(callback)
--    end
--
--    dap.configurations.java = {
--      {
--        type = 'java',
--        request = 'launch',
--        name = 'Launch Main Class',
--        mainClass = function()
--          return require('java.api').resolve_main_class()
--        end,
--        projectName = function()
--          return require('java.api').resolve_project_name()
--        end,
--      },
--    }
--    vim.lsp.commands['vscode.java.resolveMainClass'] = function()
--      return require('java.api').resolve_main_class()
--    end
--  end,
--  ft = { 'java' },
--},
--}
