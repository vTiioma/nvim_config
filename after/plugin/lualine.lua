local harpoon = require('harpoon.mark')

local function harpoon_component()
  local total_marks = harpoon.get_length()

  if total_marks == 0 then
    return ''
  end

  local current_mark = '-'
  local mark_index = harpoon.get_current_index()

  if mark_index ~= nil then
    current_mark = tostring(mark_index)
  end

  return string.format('󱡅 %s/%d', current_mark, total_marks)
end

local function truncate_branch_name(branch)
  if not branch or branch == '' then
    return ''
  end

  -- Match the branch name to the specified format
  local _, _, ticket_number = string.find(branch, 'skdillon/sko%-(%d+)%-')

  -- If the branch name matches the format, display ski={ticket number}, otherwise display teh full branch name
  if ticket_number then
    return 'sko-' .. ticket_number
  else
    return branch
  end
end

require('lualine').setup({
  options = {
    theme = 'auto',
    globalstatus = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '█', right = '█' },
  },
  sections = {
    lualine_b = {
      { 'branch', icon = '', fmt = truncate_branch_name },
      harpoon_component,
      'diff',
      'diagnostics',
    },
    lualine_c = {
      { 'filename', path = 1 },
    },
    lualine_x = {
      'filetype',
    },
  },
})
