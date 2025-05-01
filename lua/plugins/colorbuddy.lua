return {
	"tjdevries/colorbuddy.nvim",
	lazy = false,
	priority = 1000,
	enabled = true,
	init = function()
		-- Color theme name ideas
		-- * Klaritoconus
		-- * Claritoconus
		-- * Ease-stigmatism
		--

		-- -- Load ColorBuddy
		-- local cb = require("colorbuddy.init")
		-- local Color = cb.Color
		-- local Group = cb.Group
		-- local styles = cb.styles
		--
		-- -- Define Colors
		-- -- Color.new("background", "#EFF6FF") -- Off-White
		-- Color.new("background", "#f5f5fe")
		-- Color.new("text", "#202020") -- Dark Gray
		-- Color.new("secondary", "#C9D2E1") -- Light Gray
		-- Color.new("error", "#800020") -- Bordeaux
		--
		-- -- Define Groups
		-- Group.new("Normal", cb.colors.text, cb.colors.background) -- Main text on background
		-- Group.new("Comment", cb.colors.secondary, nil, styles.italic) -- Comments in light gray
		-- Group.new("Error", cb.colors.error, nil, styles.bold) -- Error messages in Bordeaux
		--
		-- -- Tree-Sitter Highlights
		-- Group.new("@conditional", cb.colors.text, nil) -- Example: Conditional keywords like "if"
		-- Group.new("@repeat", cb.colors.text, nil) -- Example: Loop keywords like "for"
		-- Group.new("@function", cb.colors.text, nil) -- Functions in dark gray
		-- Group.new("@comment", cb.colors.secondary, nil) -- Comments in light gray
		--
		-- -- Diagnostic Highlights
		-- Group.new("DiagnosticError", cb.colors.error, nil)
		-- Group.new("DiagnosticWarn", cb.colors.secondary, nil)
		-- Group.new("DiagnosticInfo", cb.colors.text, nil)
		-- Group.new("DiagnosticHint", cb.colors.secondary, nil)

		-- This is my own color scheme. Think of it like pen and paper.
		local colorbuddy = require("colorbuddy")
		local Color = colorbuddy.Color
		local Group = colorbuddy.Group
		local styles = colorbuddy.styles
		local colors = colorbuddy.colors

		-- Define colors
		-- Basic colors
		Color.new("white", "#ffffff")
		Color.new("black", "#000000")

		-- Custom colors
		-- Color.new("background", "#f8efe5")
		Color.new("background", "#E5E5E5")
		Color.new("foreground", colors.black:to_vim())
		Color.new("bordeaux", "#551128")
		-- Color.new("bordeaux", "#70060D")
		Color.new("comment", "#8B8685")
		Color.new("deep_teal", "#006b54")
		Color.new("blue_black", "#003355")
		Color.new("million_dollor_mistake", "#D4A017")
		-- Create a slightly darker shade for visual selection
		-- This is about 10% darker than the background
		Color.new("visual_select", "#e6dcd2")

		-- Basic text and background
		Group.new("Normal", colors.foreground, colors.background)

		-- Comments (still black, but italic)
		Group.new("Comment", colors.comment, nil, styles.italic)

		-- Long bar elements (vert, cursor line, search results, etc.)
		Group.new("CursorLine", nil, colors.background:dark())
		Group.new("ColorColumn", nil, colors.background:dark()) -- the long vertical bar to the right here --------------->
		Group.new("Visual", nil, colors.background:dark())
		Group.new("CurSearch", nil, colors.background:dark():dark())

		Group.new("Type", colors.bordeaux)
		Group.new("Keyword", colors.bordeaux)
		Group.new("Conditional", colors.bordeaux)
		Group.new("Repeat", colors.bordeaux)
		Group.new("Label", colors.bordeaux)
		Group.new("Identifier", colors.foreground)
		Group.new("Function", colors.foreground, nil)
		Group.new("Statement", colors.foreground)
		Group.new("Constant", colors.foreground)
		Group.new("String", colors.blue_black)
		Group.new("Special", colors.foreground)
		Group.new("PreProc", colors.foreground)

		-- Set line numbers to black
		Group.new("LineNr", colors.foreground, colors.background)

		-- Ensure popups and menus use white background and black text
		Group.new("Pmenu", colors.foreground, colors.background)
		Group.new("PmenuSel", colors.foreground, colors.background:dark())

		-- Make sure search highlighting uses the hover background
		Group.new("Search", colors.foreground, colors.background:dark())

		-- Set matching parentheses to use hover background
		Group.new("MatchParen", colors.foreground, colors.background, styles.underline)

		-- Ensure splits and status line are consistent
		Group.new("VertSplit", colors.foreground, colors.background)
		Group.new("StatusLine", colors.foreground, colors.background)
		Group.new("StatusLineNC", colors.foreground, colors.background)

		-- Set hover background to match
		Group.new("NormalFloat", colors.foreground, colors.background)
		Group.new("LspFloatWinNormal", colors.foreground, colors.background)
		Group.new("LspInlayHint", nil, colors.background:dark())
		Group.new("FloatBorder", nil, colors.background:dark())

		-- f-person/git-blame.nvim
		Group.new("GitBlame", colors.comment, nil)

		-- Mini Statusline
		Group.new("MiniStatuslineModeNormal", nil, colors.background:dark())
		Group.new("MiniStatuslineModeInsert", colors.white, colors.bordeaux)
		Group.new("MiniStatuslineModeReplace", colors.white, colors.bordeaux)
		Group.new("MiniStatuslineModeVisual", colors.white, colors.blue_black)
		Group.new("MiniStatuslineModeCommand", colors.white, colors.black)
		Group.new("MiniStatuslineModeTerminal", colors.white, colors.black)
		Group.new("MiniStatuslineFilename", colors.blue_black, nil)
		Group.new("MiniStatuslineLsp", colors.white, colors.black)
	end,
}
