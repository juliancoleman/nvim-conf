return {
    'neovim/nvim-lspconfig',
    config = function ()
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = "LSP actions",
            callback = function (ev)
                local opts = {
                    buffer = ev.buf,
                    remap = false
                }

                local opts_zz = {
                    buffer = ev.buf,
                    remap = false,
                    callback = function()
                        vim.cmd("zz")
                    end
                }

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
            end
        })
    end
}
