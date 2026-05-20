local mason_conf = {
    "mason-org/mason.nvim",
    config = function()
        require("mason").setup()
    end
}

local mason_lsp_conf = {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        local servers = {
            "lua_ls",
            "rust_analyzer",
            "ts_ls",
            "clangd",
            "groovyls",
        }

        -- no custom java home → let mason install java-language-server
        if vim.env.JAVA_LANGUAGE_SERVER_HOME == nil then
            table.insert(servers, "java_language_server")
        end

        require("mason-lspconfig").setup({ ensure_installed = servers })
    end
}


local lsp_conf = {
    "neovim/nvim-lspconfig",
    config = function()
        -- Languages
        local lsp = vim.lsp

        lsp.enable('lua_ls')

        lsp.enable('ts_ls')

        -- 1. Configure the servers (merges with defaults from nvim-lspconfig)
        lsp.config("clangd", {
            cmd = { "clangd", "--background-index", "--clang-tidy" },
            filetypes = { "c", "cpp", "objc", "objcpp" },
        })
        lsp.enable('clangd')




        -- keymaps

        -- These GLOBAL keymaps are created unconditionally when Nvim starts:
        --
        -- - "gra" (Normal and Visual mode) is mapped to |vim.lsp.buf.code_action()|
        -- - "gri" is mapped to |vim.lsp.buf.implementation()|
        -- - "grn" is mapped to |vim.lsp.buf.rename()|
        -- - "grr" is mapped to |vim.lsp.buf.references()|
        -- - "grt" is mapped to |vim.lsp.buf.type_definition()|
        -- - "grx" is mapped to |vim.lsp.codelens.run()|
        -- - "gO" is mapped to |vim.lsp.buf.document_symbol()|
        -- - CTRL-S (Insert mode) is mapped to |vim.lsp.buf.signature_help()|
        -- - |v_an| and |v_in| fall back to LSP |vim.lsp.buf.selection_range()| if
        --   treesitter is not active.
        -- - |gx| handles `textDocument/documentLink`. Example: with gopls, invoking gx
        --   on "os" in this Go code will open documentation externally: >
        --     package nvim
        --     import (
        --        "os"
        --     )
        --
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', 'grr', builtin.lsp_references, {desc = 'Find References'})


    end
}




local parent = {
    mason_conf, mason_lsp_conf,lsp_conf
}



return parent
