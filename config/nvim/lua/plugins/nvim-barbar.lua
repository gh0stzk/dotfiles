return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("barbar").setup({
            animation = false,
            sidebar_filetypes = {
                NvimTree = true,
                ["neo-tree"] = { event = "BufWipeout" },
            },
            icons = {
                filetype = {
                    custom_icons = false,
                },
                pinned = { button = "", filename = true },
            },
        })
    end,
}
