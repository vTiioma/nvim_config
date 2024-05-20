local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  -- see :help lsp-zero-keybindings
  -- to learn the available actions 
  lsp.default_keymaps({buffer = bufnr})

  vim.keymap.set("n", "?", function() vim.lsp.buf.hover() end, vim.tbl_deep_extend("force", opts, { desc = "Hover" }))
  vim.keymap.set("n", "<leader>diag", function() vim.diagnostic.setloclist() end, vim.tbl_deep_extend("force", opts, { desc = "Show [DIAG]nostics" }))
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, vim.tbl_deep_extend("force", opts, { desc = "[C]ode [A]ction" }))
end)

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "vimls",
    "tsserver",
    "eslint",
    "lua_ls",
    "html",
    "emmet_language_server",
  },
  handlers = {
    lsp.default_setup,
    lua_ls = function()
       lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
    end
  }
})

--[[ lspconfig.emmet_language_server.setup({
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
  -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
  -- **Note:** only the options listed in the table are supported.
  init_options = {
    ---@type table<string, string>
    includeLanguages = {},
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  },
}) ]]

--[[ local capabilities = require("cmp_nvim_lsp").default_capabilities();

local on_attach = function(_, _)
  local set = vim.keymap.set
  local lsp = vim.lsp.buf

  set("n", "<leader>rn", lsp.rename, { desc = "[R]e[N]ame" })
  set("n", "<leader>ca", lsp.code_action, { desc = "[C]ode [A]ction" })

  set("n", "gd", lsp.definition, { desc = "[G]et [D]efinition" })
  set("n", "gi", lsp.implementation, { desc = "[G]et [I]mplementation" })
  set("n", "gr", require("telescope.builtin").lsp_references, { desc = "[G]et [R]eferences" })
  set("n", "?", lsp.hover, { desc = "Hover" })
end

require("mason-lspconfig").setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}) ]]
