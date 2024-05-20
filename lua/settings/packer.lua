-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function() require("ibl").setup({
      exclude = {
        filetypes = {
          "dashboard",
        },
      },
    }) end
  })


  use({
	  "nvim-telescope/telescope.nvim", tag = "0.1.x",
	  requires = { { "nvim-lua/plenary.nvim" } }
  })

  use({
	  "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function() require("nvim-autopairs").setup() end
  })

  use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true }
  })

  use({
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
  })

  use({
    "numToStr/Comment.nvim",
    config = function() require("Comment").setup() end
  })

  use({
	  "folke/tokyonight.nvim",
	  as = "tokyonight",
	  config = function() vim.cmd("colorscheme tokyonight-moon") end
  })

  use({
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
    end
  })

  use({
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
    },
  })

  use("stevearc/oil.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("tpope/vim-fugitive")
  use("mbbill/undotree")
  use("windwp/nvim-ts-autotag")
end)
