-- return {
-- 	{
-- 		"craftzdog/solarized-osaka.nvim",
-- 		lazy = true,
-- 		priority = 1000,
-- 		opts = function()
-- 			return {
-- 				transparent = true,
-- 			}
-- 		end,
-- 	},
-- }

return {
	{
		"projekt0n/github-nvim-theme",
		lazy = true,
		priority = 1000,
		config = function()
			require('github-theme').setup({
				options = {
					transparent = true
				}
			})
		end,
	}
}