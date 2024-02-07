return {
    'folke/tokyonight.nvim',
    -- enabled = false,
    config = function ()
        require('tokyonight').setup({
            style = "night",
            transparent = true,
            styles = {
                comments = {
                    italic = true,
                },
                keywords = {
                    italic = true,
                },
                functions = {
                    italic = true,
                },
                variables = {
                    italic = false,
                },
                sidebars = "dark",
                floats = "dark",
            },
            sidebars = { "qf" },
            dim_inactive = true,
        })

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.opt.background = "dark"

        vim.cmd.colorscheme("tokyonight")
    end
}
