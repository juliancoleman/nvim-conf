return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        {
            'nvim-lua/plenary.nvim',
            lazy = true,
        },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        },
    },
    cmd = "Telescope",
    keys = {
        { "<leader>?", "<cmd>Telescope oldfiles<cr>", desc = "Telescope" },
        { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Telescope" },
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope" },
        { "<leader>lg", "<cmd>Telescope live_grep<cr>", desc = "Telescope" },
        { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Telescope" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope" },
        { "<leader>ht", "<cmd>Telescope help_tags<cr>", desc = "Telescope" },
    },
    config = function ()
        require('telescope').setup {
            extensions = {
                fzf = {
                    fuzzy = true,                    -- false will only do exact matching
                    override_generic_sorter = true,  -- override the generic sorter
                    override_file_sorter = true,     -- override the file sorter
                    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                }
            }
        }

        -- To get fzf loaded and working with telescope, you need to call
        -- load_extension, somewhere after setup function:
        require('telescope').load_extension('fzf')
    end,
}
