local status, tree = pcall(require, "nvim-tree")
if (not status) then
  return
end

tree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "N", action = "create" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

-- Disabling net and netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrw_plugin = 1

-- Setting Keymaps For nvimtree plugin
vim.keymap.set('n', 'tt', ':NvimTreeToggle<CR>')
vim.keymap.set('n', 'to', ':NvimTreeOpen ')
vim.keymap.set('n', 'tq', ':NvimTreeClose<CR>')
