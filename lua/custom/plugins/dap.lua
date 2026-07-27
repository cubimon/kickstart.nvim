require('dap.ext.vscode').load_launchjs('.nvim/launch.json', {
  python = { 'python' },
  lldb = { 'c', 'cpp', 'rust' },
  java = { 'java' }
})
