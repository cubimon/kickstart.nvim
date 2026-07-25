vim.lsp.config('groovyls', {
  cmd = {
    'java',
    '-jar',
    vim.fn.expand '~/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar',
  },
})

vim.lsp.enable('groovyls')

