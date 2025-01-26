return {
	"nuvic/flexoki-nvim",
	name = "flexoki",
	config = function()
		require("flexoki").setup({
			variant = "dawn",
		})
		vim.cmd("colorscheme flexoki")
	end,
}
