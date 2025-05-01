return {
	"rose-pine/neovim",
	name = "rose-pine",
	enabled = false,
	config = function()
		require("rose-pine").setup({
			variant = "dawn",
			dim_inactive_windows = true,
		})
		vim.cmd("colorscheme rose-pine")
	end,
}
