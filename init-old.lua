




--######Settings.lua#####
local opt = vim.opt
local cmd = vim.cmd

opt.relativenumber = true		--numero de lineas
opt.mouse = 'a' 		--habilitar el ratosn

--Busquedas
opt.ignorecase = true 	--no distingue entre mayusculas y minusculas
opt.smartcase = true 	--no ignora a menos que la busqueda sea en mayusculas
opt.hlsearch = false 	--Resalta las busquedas

--Identacion
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.softtabstop = 2
opt.tabstop = 2
opt.wrap = true 		--mantiene las lineas visibles


--######keymaps.lua#####
local keymap = vim.keymap
local g = vim.g

g.mapleader = ' '

keymap.set('n', '<leader>w', '<cmd>write<cr>', {desc = 'Save'})
keymap.set('n', '<leader>q', '<cmd>:q<cr>', {desc = 'Exit'})
keymap.set('n', '<leader>wq', '<cmd>:wq<cr>', {desc = 'Save and Exit'})

keymap.set({'n', 'x'}, 'cp', '"+y', {desc = 'Copy to clipboard.'})
keymap.set({'n', 'x'}, 'cv', '"+p', {desc = 'Paste to clipboard.'})
keymap.set({'n', 'x'}, 'x', '"_x', {desc = 'Delete text without altering the record'})

keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<CR>', {desc = 'Select all the text'})
--toggleterm 

--######Packer Install#####
local fn = vim.fn

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

-- Install your plugins here
local use = require('packer').use

require('packer').startup(function()
-- My plugins here
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  --Lua accelerator
  use 'lewis6991/impatient.nvim'

  --Theme 
  use 'shaunsingh/moonlight.nvim'

  --LSP
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use "williamboman/nvim-lsp-installer"
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin 

  --Toggle term
  use "akinsho/toggleterm.nvim" 

  --Commets 
  use 'numToStr/Comment.nvim'

end)

--######Packer Install#####
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})


-- luasnip setup
local luasnip = require 'luasnip'

--######moonlight.lua#####
--Config
g.moonlight_italic_comments = true
g.moonlight_italic_keywords = true
g.moonlight_italic_functions = true
g.moonlight_italic_variables = false
g.moonlight_contrast = true
g.moonlight_borders = false
g.moonlight_disable_background = true

-- Load the colorscheme
require('moonlight').set()


