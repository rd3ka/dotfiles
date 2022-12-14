local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use 'wbthomason/packer.nvim'
    use 'windwp/nvim-autopairs'
    use 'kyazdani42/nvim-tree.lua'
    use 'goolord/alpha-nvim'
    use 'lewis6991/impatient.nvim'
    use 'lukas-reineke/indent-blankline.nvim'

    use { 'akinsho/toggleterm.nvim', tag = 'v2.*' }
    use { 'akinsho/bufferline.nvim', tag = 'v2.*' }

    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} }}
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Colorschemes
    use 'lunarvim/darkplus.nvim'
    use 'rebelot/kanagawa.nvim'

    --cmp plugins
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'

    --snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'RRethy/vim-illuminate'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
