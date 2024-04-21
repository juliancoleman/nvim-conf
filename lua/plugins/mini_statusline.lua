return {
    "echasnovski/mini.statusline",
    config = function ()
      local statusline = require 'mini.statusline'
      statusline.setup {
        use_icons = true,
      }

      statusline.section_location = function ()
          return ''
      end
    end
}
