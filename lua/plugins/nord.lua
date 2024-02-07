return {
    'nordtheme/vim',
    enabled = false,
    config = function ()
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.opt.background = "dark"

        vim.cmd.colorscheme("nord")
    end
}
