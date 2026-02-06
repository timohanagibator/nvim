return {
	{
		'nvim-telescope/telescope.nvim',
		keys = {
			{"<leader>sf", "<cmd>Telescope find_files<cr>"},
			{"<leader>sg", "<cmd>Telescope live_grep<cr>"},
			{"<leader>sb", "<cmd>Telescope buffers<cr>"},
			{"<leader>sh", "<cmd>Telescope help_tags<cr>"}
		},
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- optional but recommended
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		}
	}
}
