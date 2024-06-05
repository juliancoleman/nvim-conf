return {
   "echasnovski/mini.statusline",
   config = function ()
      local statusline = require 'mini.statusline'
      local use_icons = true

      statusline.setup {
         use_icons,
      }

      ---@diagnostic disable-next-line
      statusline.section_filename = function ()
         return "%f %m"
      end

      ---@diagnostic disable-next-line
      statusline.section_fileinfo = function ()
         local filetype = vim.bo.filetype

         -- don't show anything if we can't detect file type or not inside a "normal buffer"
         if (filetype == '') or vim.bo.buftype ~= '' then
            return "%r"
         end

         local function get_filetype_icon()
            if not use_icons then
               return ""
            end

            local has_devicons, devicons = pcall(require, "nvim-web-devicons")
            if not has_devicons then
               return ""
            end

            local filename, ext = vim.fn.expand("%:t"), vim.fn.expand("%:e")

            return devicons.get_icon(filename, ext, { default = true })
         end

         local icon = get_filetype_icon()
         if icon ~= "" then
            filetype = string.format("%s %s", icon, filetype)
         end

         return string.format("%s%%r", filetype)
      end

      ---@diagnostic disable-next-line
      statusline.section_location = function ()
         return '[%p%% %L] %2l:%-2v'
      end
   end
}
