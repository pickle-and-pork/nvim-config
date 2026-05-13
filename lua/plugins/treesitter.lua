local plugin = {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  dependencies = {
    "windwp/nvim-ts-autotag"
  },
  config = function()
    -- my config here
    local treeSitterPath = vim.fn.stdpath('data') .. '/treesitter'
    local nvim_treesitter = require('nvim-treesitter')
    nvim_treesitter.setup({
      install_dir = treeSitterPath
    })
    vim.opt.rtp:prepend(treeSitterPath)
    nvim_treesitter.install({
       'rust','cpp', 'java','kotlin','javascript','typescript', 'tsx','python','sql','html','xml','vim','vimdoc','lua','markdown','markdown_inline','gitignore', 'html', 'css', 'json'
    })
    vim.api.nvim_create_autocmd('FileType' , {
      pattern = {'rust','cpp', 'java','kotlin','javascript','typescript', 'tsx','python','sql','html', 'xml','vim','vimdoc','lua','markdown','markdown_inline','gitignore', 'json', 'jsonc', 'jsonl', 'json5'},
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        vim.opt_local.foldmethod = "expr"
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.opt_local.foldenable = true
        vim.opt_local.foldlevel = 99
      end,
    })

  end
}

--TODO: install nvim-treesitter/nvim-treesitter-context

local nvim_treesitter_context = {} 




return plugin






