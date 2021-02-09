local M = {}

M.set_overrides = function(clear_colors, set_colors)
  local highlights = {}

  for _, v in pairs(clear_colors) do
    table.insert(highlights, "highlight clear "..v)
  end
  for k,v in pairs(set_colors) do
    local highlight = "highlight "..k
    for attr, value in pairs(v) do
      highlight = highlight.." "..attr.."="..value
    end
    table.insert(highlights, highlight)
  end

  for _, c in pairs(highlights) do
    vim.api.nvim_command(c)
  end
  vim.api.nvim_command("augroup coloroverrides")
  for _, c in pairs(highlights) do
    vim.api.nvim_command("autocmd ColorScheme * "..c)
  end
  vim.api.nvim_command("augroup END")
end

return M
