return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "folke/lazydev.nvim", opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(ev)
				local opts = {
					buffer = ev.buf,
					remap = false,
				}

				local opts_zz = {
					buffer = ev.buf,
					remap = false,
					callback = function()
						vim.cmd("zz")
					end,
				}

				-- optionally look into using Telescope here so that we can see
				-- results in a float instead of in the quickfix list
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts_zz)
				vim.keymap.set("n", "gf", vim.lsp.buf.format, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts_zz)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts_zz)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>rs", vim.lsp.buf.rename, opts)
				vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				--    See `:help CursorHold` for information about when this is executed
				--
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				-- local client = vim.lsp.get_client_by_id(ev.data.client_id)
				-- if client and client.server_capabilities.documentHighlightProvider then
				--     vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				--         buffer = ev.buf,
				--         callback = vim.lsp.buf.document_highlight,
				--     })
				--
				--     vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				--         buffer = ev.buf,
				--         callback = vim.lsp.buf.clear_references,
				--     })
				-- end
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local servers = {
			eslint = {},
			gopls = {},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
			rust_analyzer = {},
			tailwindcss = {},
			tsserver = {},
			-- prettier = {},
		}

		require("mason").setup()
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- used to format Lua code
		})

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
