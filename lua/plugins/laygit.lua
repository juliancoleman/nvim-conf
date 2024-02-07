return {
    'kdheepak/lazygit.nvim',
    cmd = "LazyGit",
    keys = {
        { "<leader>gg", vim.cmd.LazyGit, desc = "LazyGit" }
    },
    dependencies = {
        "nvim-telescope/telescope.nvim",
        'nvim-lua/plenary.nvim'
    },
    config = function()
        require("telescope").load_extension("lazygit")
    end
}
