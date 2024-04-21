return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
    },
    config = function ()
        local cmp = require('cmp')

        local luasnip = require('luasnip')
        luasnip.config.setup {}

        cmp.setup({
            snippet = {
                expand = function (args)
                    require('luasnip').lsp_expand(args.body)
                end
            },
            completion = { completeopt = 'menu,menuone,noinsert' },
            window = {
                documentation = cmp.config.window.bordered(),
                completion = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
                -- Think of <c-l> as moving to the right of your snippet expansion.
                --  So if you have a snippet that's like:
                --  function $name($args)
                --    $body
                --  end
                --
                -- <c-l> will move you to the right of each of the expansion locations.
                -- <c-h> is similar, except moving you backwards.
                ['<C-l>'] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { 'i', 's' }),
                ['<C-h>'] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { 'i', 's' }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
            }),
            formatting = {
                expandable_indicator = true,
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
