local status, github_theme = pcall(require, "github-theme")
if (not status) then return end

github_theme.setup({
  options = {
    transparent = true,       -- Disable setting background
  },
  palettes = {},
  specs = {},
  groups = {},
})

-- setup must be called before loading
vim.cmd('colorscheme github_dark')
