return {
    'olivercederborg/poimandres.nvim',
    -- enabled = false,
    config = function ()
        local p = require("poimandres.palette")

        -- cmp menu colors
        vim.cmd.colorscheme("poimandres")

        vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg=p.blueGray1 })
        vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg=p.teal1 })
        vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })
        vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg=p.blueGray1 })
        vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
        vim.api.nvim_set_hl(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
        vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg=p.teal1 })
        vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
        vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg=p.teal1 })
        vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
        vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.opt.background = "dark"

        vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = p.background2 })
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = p.blueGray1 })
        vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none", fg=p.blueGray1 })
        vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none", fg=p.blueGray1 })

    end
}
