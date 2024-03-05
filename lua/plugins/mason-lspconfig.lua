return {
    'williamboman/mason-lspconfig.nvim',
    config = function ()
        local lspconfig = require('lspconfig')
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

        require('mason-lspconfig').setup({
            ensure_installed = {
                "emmet_ls",
                "emmet_language_server",
                "eslint",
                "gopls",
                "lua_ls",
                "rust_analyzer",
                "tailwindcss",
                "tsserver",
            }
        })

        require('mason-lspconfig').setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = lsp_capabilities,
                    on_attach = function ()
                        local _border = "single"

                        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                            vim.lsp.handlers.hover, {
                                border = _border
                            }
                        )

                        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
                            vim.lsp.handlers.signature_help, {
                                border = _border
                            }
                        )

                        vim.diagnostic.config{
                            float={border=_border}
                        }
                    end
                })
            end
        })

        -- since Mason is responsible for adding emmet, we
        -- will set that up now.
        local configs = require'lspconfig/configs'
        local util = require 'lspconfig/util'

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        if not lspconfig.emmet_language_server then
            configs.emmet_language_server = {
                default_config = {
                    cmd = {'emmet-language-server', '--stdio'};
                    filetypes = {
                        'html', 'typescriptreact', 'javascriptreact', 'javascript',
                        'typescript', 'javascript.jsx', 'typescript.tsx', 'css'
                    },
                    root_dir = util.root_pattern("package.json", ".git"),
                    settings = {};
                };
            }
        end
        lspconfig.emmet_ls.setup{ capabilities = capabilities; }
    end
}
