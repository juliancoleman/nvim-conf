return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			float = {
				padding = 2,
				max_width = 100,
				max_height = 35,
			},
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name)
					-- add files here that should be hidden always, such as .DS_Store
					return name == "./" or name == ".."
				end,
			},
		})
	end,
}
