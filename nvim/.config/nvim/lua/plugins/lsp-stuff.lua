return {
	{
			"mason-org/mason.nvim",
			opts = {}
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "basedpyright" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			vim.lsp.enable("lua_ls", "basedpyright")
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
		end
	}
}
