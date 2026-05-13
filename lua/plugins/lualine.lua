local lualine_plugin  = {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local lualine = require('lualine')
        lualine.setup()
     end
}



return lualine_plugin
