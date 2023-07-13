-- require('poimandres').setup {}
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
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
    },
    sidebars = { "qf" },
    dim_inactive = true,
})

-- set the Neovim color (courtesy of ThePrimeagen)
-- if no theme is provided, it defaults to the beautiful, the lovely,
-- rose-pine
function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils("tokyonight")
