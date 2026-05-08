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
        require("mason-lspconfig").setup({
            -- jdtls must be in ensure_installed so mason installs it on new machines.
            -- automatic_enable excludes it so lspconfig does NOT auto-start it —
            -- nvim-jdtls manages the jdtls lifecycle via its own FileType autocmd.
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "ts_ls",
                "clangd",
                "groovyls"
            },
        })
    end
}


local lsp_conf = {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconf = vim.lsp.config
        local lsp = vim.lsp

        lsp.enable('lua_ls')

        lsp.enable('ts_ls')

        -- 1. Configure the servers (merges with defaults from nvim-lspconfig)
        vim.lsp.config("clangd", {
            cmd = { "clangd", "--background-index", "--clang-tidy" },
            filetypes = { "c", "cpp", "objc", "objcpp" },
        })
        lsp.enable('clangd')
        local java_lang_s_home = vim.env.JAVA_LANGUAGE_SERVER_HOME
        if (java_lang_s_home ~= nil) then
            -- vim.notify('java language server detected', vim.log.levels.INFO)
            lsp.config['java_language_server'] = {
                cmd = {java_lang_s_home .. '/dist/lang_server_mac.sh'},
                filetypes = {'java'},
                root_markers = {
                    {'.idea', '.settings', '.vscode'}, -- other IDE's indicating that it's a root
                    {'pom.xml'}, -- only pom for now, but need to setup the gradle both through kotlin and/or gradle
                    '.git'
                }
            }
            lsp.enable('java_language_server')
        else
            vim.notify('java language server isn\'t setup', vim.log.levels.WARN)
        end

    end
}




local parent = {
    mason_conf, mason_lsp_conf,lsp_conf
}



return parent
