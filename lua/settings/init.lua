-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require("settings.config")
require("settings.remap")
require("settings.packer")
require("settings.lsp")
require("settings.comments")
require("settings.completions")

require("oil").setup({
  default_file_explorer = false,
  keymaps = { ["<leader><BS>"] = "actions.parent" },
})

-- empty setup using defaults
require("nvim-tree").setup {
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')
    local map = vim.keymap.set

    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    map(
      { "n", "v" },
      "<C-b>",
      api.tree.toggle,
      opts("Toggle")
    )

    map(
      { "n", "v" },
      "<leader><BS>",
      api.tree.change_root_to_parent,
      opts("Up")
    )

    map(
      { "n", "v" },
      "<leader><leader>",
      api.tree.change_root_to_node,
      opts("CD")
    )
  end,
}
require("Comment").setup()
