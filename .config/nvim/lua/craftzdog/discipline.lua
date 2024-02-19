local M = {}

function M.cowboy()
  local id
  local count = 0
  local timer = vim.loop.new_timer()

  local exclude_filetypes = { "neo-tree", "aerial" }

  local function should_exclude_filetype(ft)
    for _, excluded_ft in ipairs(exclude_filetypes) do
      if ft == excluded_ft then return true end
    end
    return false
  end

  vim.api.nvim_create_augroup("checkfiletype", { clear = true })

  vim.api.nvim_create_autocmd("WinLeave", {
    pattern = "*",
    group = "checkfiletype",
    callback = function()
      local ft = vim.api.nvim_buf_get_option(0, "filetype")
      if should_exclude_filetype(ft) then count = 0 end
    end,
  })

  for _, key in ipairs { "h", "j", "k", "l", "+", "-" } do
    vim.keymap.set("n", key, function()
      if vim.v.count > 0 then count = 0 end

      count = count + 1
      if count >= 10 then
        local ft = vim.bo.filetype
        if not should_exclude_filetype(ft) then
          ok, id = pcall(vim.notify, "Hold it Cowboy!", vim.log.levels.WARN, {
            icon = "🤠",
            replace = id,
            keep = function() return count >= 10 end,
          })
          if not ok then id = nil end

          return nil
        end
      end

      timer:start(2000, 0, function() count = 0 end)

      return key
    end, { expr = true, silent = true })
  end

  vim.api.nvim_command "augroup END"
end

return M
