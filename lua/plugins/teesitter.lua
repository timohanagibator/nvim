return {
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',
		opts = {
			ensure_installed = { "html", "javascript", "typescript", "lua" },
		}
	},
}
