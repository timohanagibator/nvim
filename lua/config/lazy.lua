-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- display virtual text
vim.diagnostic.config({
	virtual_text = true,
})
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.termguicolors = true

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
			refresh_time = 16, -- ~60fps
			events = {
				'WinEnter',
				'BufEnter',
				'BufWritePost',
				'SessionLoadPost',
				'FileChangedShellPost',
				'VimResized',
				'Filetype',
				'CursorMoved',
				'CursorMovedI',
				'ModeChanged',
			},
		}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}
-- colorizer
require("colorizer").setup({
	filetypes = { "*" }, -- Filetype options.  Accepts table like `user_default_options`
	buftypes = {}, -- Buftype options.  Accepts table like `user_default_options`
	-- Boolean | List of usercommands to enable.  See User commands section.
	user_commands = true, -- Enable all or some usercommands
	lazy_load = false, -- Lazily schedule buffer highlighting setup function
	user_default_options = {
		names = true, -- "Name" codes like Blue or red.  Added from `vim.api.nvim_get_color_map()`
		names_opts = { -- options for mutating/filtering names.
			lowercase = true, -- name:lower(), highlight `blue` and `red`
			camelcase = true, -- name, highlight `Blue` and `Red`
			uppercase = true, -- name:upper(), highlight `BLUE` and `RED`
			strip_digits = false, -- ignore names with digits,
			-- highlight `blue` and `red`, but not `blue3` and `red4`
		},
		-- Expects a table of color name to #RRGGBB value pairs.  # is optional
		-- Example: { cool = "#107dac", ["notcool"] = "ee9240" }
		-- Set to false to disable, for example when setting filetype options
		names_custom = false, -- Custom names to be highlighted: table|function|false
		RGB = true, -- #RGB hex codes
		RGBA = true, -- #RGBA hex codes
		RRGGBB = true, -- #RRGGBB hex codes
		RRGGBBAA = true, -- #RRGGBBAA hex codes
		AARRGGBB = false, -- 0xAARRGGBB hex codes
		rgb_fn = true, -- CSS rgb() and rgba() functions
		hsl_fn = false, -- CSS hsl() and hsla() functions
		oklch_fn = false, -- CSS oklch() function
		css = false, -- Enable all CSS *features*:
		-- names, RGB, RGBA, RRGGBB, RRGGBBAA, AARRGGBB, rgb_fn, hsl_fn, oklch_fn
		css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn, oklch_fn
		-- Tailwind colors.  boolean|'normal'|'lsp'|'both'.  True sets to 'normal'
		tailwind = true, -- Enable tailwind colors
		tailwind_opts = { -- Options for highlighting tailwind names
			update_names = false, -- When using tailwind = 'both', update tailwind names from LSP results.  See tailwind section
		},
		-- parsers can contain values used in `user_default_options`
		sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
		xterm = false, -- Enable xterm 256-color codes (#xNN, \e[38;5;NNNm)
		-- Highlighting mode.  'background'|'foreground'|'virtualtext'
		mode = "background", -- Set the display mode
		-- Virtualtext character to use
		virtualtext = "■",
		-- Display virtualtext inline with color.  boolean|'before'|'after'.  True sets to 'after'
		virtualtext_inline = 'before',
		-- Virtualtext highlight mode: 'background'|'foreground'
		virtualtext_mode = "foreground",
		-- update color values even if buffer is not focused
		-- example use: cmp_menu, cmp_docs
		always_update = false,
		-- hooks to invert control of colorizer
		hooks = {
			-- called before line parsing.  Accepts boolean or function that returns boolean
			-- see hooks section below
			disable_line_highlight = false,
		},
	},
})
require('nvim-ts-autotag').setup({
})
vim.cmd.colorscheme "tokyonight"
