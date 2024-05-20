local themes = require("telescope.themes")
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
vim.keymap.set("n", "<leader>ff", function()
  builtin.find_files(themes.get_dropdown { previewer = false })
end, { desc = "[F]uzzy [F]ind files" })
vim.keymap.set("n", "<leader>fg", function()
  builtin.git_files(themes.get_dropdown { previewer = false })
end, { desc = "[F]ind [G]it files" })
vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "[F]ind [S]pecific text in files" })
vim.keymap.set("n", "<leader>fc", function()
  builtin.find_files { cwd = vim.fn.stdpath "config" }
end, { desc = "[F]ind [C]onfig files" })
vim.keymap.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, tc.
  builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = "[/] Fuzzy search in current buffer" })
