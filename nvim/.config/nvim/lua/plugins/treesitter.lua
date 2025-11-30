return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {'bash', 'lua', 'markdown', 'python'},
		auto_install = true,  -- Auto install languages
		highlight = {enable = true},
		indent = {enable = true},
	}
}
