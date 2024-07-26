return {
	"echasnovski/mini.statusline",
	config = function()
		local statusline = require("mini.statusline")
		local conform = require("conform")
		local use_icons = true

		-- configure groupings
		local active = function()
			local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
			local git = MiniStatusline.section_git({ trunc_width = 40 })
			local diff = MiniStatusline.section_diff({ trunc_width = 75 })
			local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
			local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
			local filename = MiniStatusline.section_filename({ trunc_width = 140 })
			local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
			local location = MiniStatusline.section_location({ trunc_width = 75 })
			local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

			-- Usage of `MiniStatusline.combine_groups()` ensures highlighting and
			-- correct padding with spaces between groups (accounts for 'missing'
			-- sections, etc.)
			return MiniStatusline.combine_groups({
				{ hl = mode_hl, strings = { mode } },
				{ hl = "MiniStatuslineDevinfo", strings = { git, diff } },
				"%<", -- Mark general truncate point
				{ hl = "MiniStatuslineFilename", strings = { diagnostics, filename } },
				"%=", -- End left alignment
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
				{ hl = "DiffText", strings = { lsp } },
				{ hl = mode_hl, strings = { search, location } },
			})
		end

		statusline.setup({ content = { active = active }, use_icons })

		---@diagnostic disable-next-line
		statusline.section_filename = function()
			return "%f %m"
		end

		---@diagnostic disable-next-line
		statusline.section_lsp = function()
			-- map client names into something a bit more human readable.
			local client_map = {
				lua_ls = "Lua LSP",
				stylua = "StyLua",
				eslint = "ESLint",
				tsserver = "TypeScript",
				tailwindcss = "Tailwind",
				prettier = "Prettier",
			}

			local attached_clients = vim.lsp.buf_get_clients(vim.api.nvim_get_current_buf())
			local client_names = {}

			for _, client in pairs(attached_clients) do
				table.insert(client_names, client_map[client.name] or client.name)
			end

			local formatters = vim.tbl_flatten(conform.list_formatters_for_buffer(vim.api.nvim_get_current_buf()))

			for _, formatter in pairs(formatters) do
				table.insert(client_names, client_map[formatter] or formatter)
			end

			if vim.tbl_count(client_names) == 0 then
				return ""
			end

			return string.format("[ %s ]", table.concat(client_names, " | "))
		end

		---@diagnostic disable-next-line
		statusline.section_fileinfo = function()
			local filetype = vim.bo.filetype

			-- don't show anything if we can't detect file type or not inside a "normal buffer"
			if (filetype == "") or vim.bo.buftype ~= "" then
				return ""
			end

			local function get_filetype_icon()
				if not use_icons then
					return ""
				end

				local has_devicons, devicons = pcall(require, "nvim-web-devicons")
				if not has_devicons then
					return ""
				end

				local filename, ext = vim.fn.expand("%:t"), vim.fn.expand("%:e")

				return devicons.get_icon(filename, ext, { default = true })
			end

			local icon = get_filetype_icon()
			if icon ~= "" then
				filetype = string.format("%s %s", icon, filetype)
			end

			return string.format("%s%%r", filetype)
		end

		---@diagnostic disable-next-line
		statusline.section_location = function()
			return "[%p%% %L] %2l:%-2v"
		end
	end,
}
