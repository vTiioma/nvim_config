local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Toggle [HA]rpoon" })
vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu, { desc = "Toggle [H]arpoon [M]enu" })

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "Toggle harpoon [1]" })
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = "Toggle harpoon [2]" })
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = "Toggle harpoon [3]" })
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = "Toggle harpoon [4]" })
