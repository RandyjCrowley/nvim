-- You can add your own plugins here or in other files in this directory! I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
      require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/lua/snippets/' }
      require('luasnip').config.set_config {
        history = true,
        updateevents = 'TextChanged,TextChangedI',
      }
    end,
  },
}
