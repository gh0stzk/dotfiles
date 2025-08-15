return {
  "github/copilot.vim",
  config = function()
    -- Auto active copilot
    vim.cmd("Copilot enable")

    -- Recomends options
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<C-s>", 'copilot#Accept("<CR>")', { silent = true, expr = true }) -- Use <Ctrl + s> to accept suggestion
    vim.api.nvim_set_keymap("i", "<C-n>", 'copilot#Dismiss()', { silent = true, expr = true }) -- Use <Ctrl + n> to dismiss suggestion
    vim.api.nvim_set_keymap("i", "<M-]>", "<Plug>(copilot-next)", {}) -- Use <Alt + [>  to go to next suggestion
    vim.api.nvim_set_keymap("i", "<M-[>", "<Plug>(copilot-previous)", {}) -- Use <Alt + ]> to go to previous suggestion
    vim.api.nvim_set_keymap("i", "<C-Space>", "<Plug>(copilot-suggest)", {}) -- Use <Ctrl + Space> to trigger suggestion
    vim.api.nvim_set_keymap("n", "<leader>cp", ":Copilot panel<CR>", { noremap = true, silent = true }) -- Use <leader + cp> to open copilot panel
  end,
}
