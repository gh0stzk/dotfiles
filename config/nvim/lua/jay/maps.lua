local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit<Return><C-w>w')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')


-- Debug 
keymap.set('n', '<F5>', ':DapContinue<CR>')
keymap.set('n', '<F3>', ':DapStepOver<CR>')
keymap.set('n', '<F2>', ':DapStepInto<CR>')
keymap.set('n', '<F12>', ':DapOut<CR>')
keymap.set('n', '<Space>b', ':DapToggleBreakpoint<CR>')
keymap.set('n', '<Space>b', ':DapToggleBreakpoint<CR>')
keymap.set('n', '<Space>dr', ':DapToggleRep<CR>')

-- Word Wrap
keymap.set('n', '<Space>z', ':set nowrap!<Return>')

-- Format Code
keymap.set('n', '<Space>f', ':lua vim.lsp.buf.format({ async = true })<Return>')

-- Code Action Menu
keymap.set('n', '<Space>s', ':lua vim.lsp.buf.code_action()<Return>')


-- Toggle Transparent
keymap.set('n', 'tr', ':TransparentToggle<Return>')

-- TODO Telescope
keymap.set('n', 'td', ':TodoTelescope<Return>')

keymap.set('n', '<Space>?', ':Telescope oldfiles<Return>')
keymap.set('n', '<Space><Space>', ':Telescope buffers<Return>')

keymap.set('n', '<Space>sf', ':Telescope find_files<Return>')
keymap.set('n', '<Space>sh', ':Telescope help_tags<Return>')
keymap.set('n', '<Space>sw', ':Telescope grep_string<Return>')
keymap.set('n', '<Space>sg', ':Telescope live_grep<Return>')
keymap.set('n', '<Space>sd', ':Telescope diagnostics<Return>')

keymap.set('n', '<Space>rn', ':lua vim.lsp.buf.rename()<Return>')
keymap.set('n', '<Space>ca', ':lua vim.lsp.buf.code_action()<Return>')
keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<Return>')
keymap.set('n', 'gr', ':Telescope lsp_references<Return>')
keymap.set('n', 'gI', ':lua vim.lsp.buf.implementation()<Return>')
keymap.set('n', '<Space>D', ':lua vim.lsp.buf.type_definition()<Return>')
keymap.set('n', '<Space>ds', ':Telescope lsp_document_symbols<Return>')
keymap.set('n', '<Space>ws', ':Telescope lsp_dynamic_workspace_symbols<Return>')

-- See `:help K` for why this keymap
keymap.set('n', 'K', ':lua vim.lsp.buf.hover()<Return>')
keymap.set('n', '<C-k>', ':lua vim.lsp.buf.signature_help()<Return>')

-- Lesser used LSP functionality
keymap.set('n', 'gD', ':lua vim.lsp.buf.declaration()<Return>')
keymap.set('n', '<Space>wa', ':lua vim.lsp.buf.add_workspace_folder()<Return>')
keymap.set('n', '<Space>wr', ':lua vim.lsp.buf.remove_workspace_folder()<Return>')
keymap.set('n', '<Space>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end)

