-- a snippet plugin is required for hrsh7th/nvim-cmp to work.
-- Consequently, we need to use saadparwaiz1/cmp_luasnip as
-- a completion source in order for completions to show in
-- the list.

return {
    'L3MON4D3/LuaSnip',
    dependencies = {
        'saadparwaiz1/cmp_luasnip',
    }
}
