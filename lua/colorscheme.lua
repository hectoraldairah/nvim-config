local color_scheme = 'everforest'

local theme_opts = {
  everforest_background = 'hard',
  everforest_better_performance = 1,
  everforest_enable_italic = 1,
  everforest_ui_contrast = 'high',
  everforest_diagnostic_text_highlight = 1,
  everforest_diagnostic_line_highlight = 1,
  everforest_current_word = 'bold',
  everforest_cursor = 'aqua'
} 

vim.cmd('colorscheme everforest')

for k, v in pairs(theme_opts) do
  vim.g[k] = v
end
