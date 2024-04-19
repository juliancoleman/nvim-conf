return {
    "ntk148v/komau.vim",
    enabled = false,
    config = function ()
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.opt.background = "dark"

        vim.cmd.colorscheme("komau")

        vim.api.nvim_set_hl(0, "Cursor", { fg = "#ff0000", bg = "#ff0000" })
        vim.api.nvim_set_hl(0, "CursorReset", { fg = "#ff0000", bg = "#ff0000" })
    end
}
