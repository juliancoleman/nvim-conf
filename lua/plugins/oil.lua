return {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require("oil").setup({
            view_options = {
                show_hidden = true,
                is_always_hidden = function(name, bufnr)
                    -- add files here that should be hidden always, such as .DS_Store
                    return false
                end
            }
        })
    end
}
