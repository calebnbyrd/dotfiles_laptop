return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require('tokyonight').setup {
			transparent = true,
		}
		require('tokyonight').load()
	end
}
