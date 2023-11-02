return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua',
    },
    config = function ()
        local cmp = require('cmp')

        cmp.setup({
            snippet = {
                expand = function (args)
                    require('luasnip').lsp_expand(args.body)
                end
            },
            window = {
                documentation = cmp.config.window.bordered(),
                completion = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
            }, {
                { name = 'buffer' }
            }),
            formatting = {
                fields = {"abbr", "kind"},
                format = function (_, item)
                    local cmp_kinds = {
                        Text = "¶ ",
                        Method = "∫ ",
                        Function = "∫ ",
                        Constructor = " ",
                        Field = "α ",
                        Variable = "α ",
                        Class = "C ",
                        Interface = "⊷ ",
                        Module = "M ",
                        Property = "α ",
                        Unit = "¤ ",
                        Value = "V ",
                        Enum = "≔ ",
                        Keyword = "ℇ ",
                        Snippet = "S ",
                        Color = "# ",
                        File = "↗ ",
                        Reference = "» ",
                        Folder = "‥ ",
                        EnumMember = "≔ ",
                        Constant = "π ",
                        Struct = "☊ ",
                        Event = " ",
                        Operator = "± ",
                        TypeParameter = "⊷ ",
                    }

                    item.kind = (cmp_kinds[item.kind] or "")
                    return item
                end,
            }
        })
    end
}
