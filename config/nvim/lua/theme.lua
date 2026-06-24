local M = {}

function M.reload()
    package.loaded["generated.theme"] = nil

    local palette = require("generated.theme")

    require("mini.base16").setup({
        palette = palette,
    })

    -- Overrides personalizados
    vim.api.nvim_set_hl(0, "CursorLine", {
        bg = palette.base02,
    })

    vim.api.nvim_set_hl(0, "CursorLineNr", {
        bg = palette.base02,
        bold = true,
    })

    vim.api.nvim_set_hl(0, "LineNrAbove", {
        fg = palette.base05,
    })

    vim.api.nvim_set_hl(0, "LineNrBelow", {
        fg = palette.base05,
    })

    vim.api.nvim_set_hl(0, "CursorLineNr", {
        fg = palette.base09,
    })

    vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", {
        bg = palette.base0B,
        fg = palette.base00,
    })

    vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", {
        bg = palette.base03,
        fg = palette.base00,
    })

    vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", {
        bg = palette.base06,
        fg = palette.base00,
    })

    vim.api.nvim_set_hl(0, "MiniStatuslineFilename", {
        bg = palette.base00,
        fg = palette.base05,
    })

    vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", {
        bg = palette.base0E,
        fg = palette.base00,
    })

    vim.api.nvim_set_hl(0, "BufferInactiveSign", {
        bg = palette.base00,
        fg = palette.base00,
    })

    vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", {
        --bg = palette.base00,
        fg = palette.base04,
    })
end

return M
