local status, db = pcall(require, "dashboard")
if (not status) then return end

vim.keymap.set('n', 'db', ':Dashboard<CR>')
db.setup({
  theme = 'hyper',
  config = {
    week_header = {
      enable = true
    },
    shortcut = {
      {
        icon = "📦",
        desc = 'Update Packer',
        group = '@property',
        action = 'PackerSync',
        key = 'u'
      },
      {
        icon = "👾",
        desc = 'Mason',
        group = '@property',
        action = 'Mason',
        key = 'U'
      },
      {
        icon = "🌳",
        desc = 'Update Tree Sitter',
        group = '@property',
        action = 'TSUpdate',
        key = 'T'
      },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
    },
  },
})
