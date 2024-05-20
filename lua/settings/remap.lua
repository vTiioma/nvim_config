local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "Q", "<nop>", { desc = "Do nothing on Shift-Q" })
map("n", "<C-i>", "<C-i>", { noremap = true, silent = true, desc = "Make sure CTRL+i is not confused with Tab in Vim" })
-- map("n", "<leader><BS>", vim.cmd.Ex, { desc = "Exit to file directory" })

map({ "n", "i" }, "<C-z>", "<CMD>undo<CR>", { desc = "Undo" })
map({ "n", "i" }, "<C-y>", "<CMD>redo<CR>", { desc = "Redo" })

map("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down one" })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up one" })

map("n", "J", ":m+<CR>==", { silent = true, desc = "Move line down one" })
map("n", "K", ":m-2<CR>==", { silent = true, desc = "Move line up one" })

map("n", "+", "<C-a>", { silent = true, desc = "Increment number" })
map("n", "-", "<C-x>", { silent = true, desc = "Decrement number" })

map("n", "<C-a>", "ggVG", { silent = true, desc = "Select all" })

-- map("n", "J", "mzJ`z", { desc = "Move bottom line to end of current line without moving the cursor" })
map("n", "<C-d>", "<C-d>zz", { desc = "Keep cursor in place when half page jumping down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Keep cursor in place when half page jumping up" })

map("n", "n", "nzzzv", { desc = "Goto next entry in search" })
map("n", "N", "Nzzzv", { desc = "Goto previous entry in search" })

map("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Navigate left on split window view" })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Navigate down on split window view" })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Navigate up on split window view" })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Navigate right on split window view" })

map({ "n", "o", "x" }, "H", "^", { noremap = true, silent = true, desc = "Jump to beginning of text on the line" })
map({ "n", "o", "x" }, "L", "g_", { noremap = true, silent = true, desc = "Jump to end of line" })

map("x", "p", [["_dP]], { desc = "Paste without overwritting current copy buffer" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete" })

map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy" })
map("n", "<leader>Y", [["+Y]], { desc = "Copy" })

map({ "i", "v" }, "<C-c>", "<Esc>", { desc = "Escape to Normal Mode" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map("v", "<Tab>", ">gv", { desc = "Indent selection" })
map("v", "<S-Tab>", "<gv", { desc = "Unindent selection" })

map("n", "<Tab>", ">>", { desc = "Indent line" })
map("n", "<S-Tab>", "<<", { desc = "Unindent line" })
map("i", "<S-Tab>", "<C-D>", { desc = "Unindent line" })

map("n", "<leader>oil", "<CMD>Oil<CR>", { desc = "Open oil in parent directory" })
map({ "n", "v" }, "<C-b>", "<CMD>NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree" })

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- map("n", "<C-f>", "<CMD>silent !tmux neww tmux-sessionizer<CR>")
-- map("n", "<leader>f", vim.lsp.buf.format, { desc = "Format document" })

-- map("n", "<C-k>", "<CMD>cnext<CR>zz")
-- map("n", "<C-j>", "<CMD>cprev<CR>zz")
-- map("n", "<leader>k", "<CMD>lnext<CR>zz")
-- map("n", "<leader>j", "<CMD>lprev<CR>zz")

map("v", "<C-f>", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], { desc = "Do a search for hilighted text" })

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>x", "<CMD>!chmod +x %<CR>", { silent = true })

map("n", "<leader>cdr", "<cmd>e ~/Repos<CR><cmd>cd %:p:h<CR>", { desc = "Goto Repo" })
map("n", "<leader>cds", "<cmd>e ~/.config/nvim<CR><cmd>cd %:p:h<CR>", { desc = "Goto Settings" })
map("n", "<leader>ccc", "<cmd>!code %:p:h<CR>", { desc = "Open current directory in VS Code" })

map("n", "<leader>set", "<cmd>cd %:p:h<CR>", { desc = "Set current path as Vim root" })
-- map("n", "<leader><leader>", "<cmd>so<CR>", { desc = "Shout out" })
