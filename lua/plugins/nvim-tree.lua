local nvim_tree =  {
    "nvim-tree/nvim-tree.lua",
    version = "1.16.0", tag = "v1.16.0",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        vim.keymap.set("n", "<leader>e","<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Tree [E]xplorer"})
        require("nvim-tree").setup({
            hijack_netrw = true,
            auto_reload_on_write = true,
            update_focused_file = {
                enable = false,
                update_root = false,
            },
            git = {
                ignore = false,
            },
            view = {
                preserve_window_proportions = true,
                side = "left",
                width = 50
            }
        })
        -- KEYMAPS
        -- Press <leader>tff to instantly reveal and jump to the active file inside the tree
vim.keymap.set("n", "<leader>tf", ":NvimTreeFindFile<CR>", { silent = true , desc = 'Nvim [T]ree [F]ind File'})


    end,
}

-- TODO: possibly consider adding this
--
-- 1. Initialize a global variable tracking the toggle state (true = tracking is active)
-- _G.nvim_tree_auto_focus = true
--
-- require("nvim-tree").setup({
--   update_focused_file = {
--     -- Use a custom function instead of a boolean value
--     enable = function()
--       return _G.nvim_tree_auto_focus
--     end,
--     update_root = false,
--   },
-- })
--
-- -- 2. Create a custom function to toggle the state variable and print the status
-- local function toggle_nvim_tree_focus()
--   _G.nvim_tree_auto_focus = not _G.nvim_tree_auto_focus
--   if _G.nvim_tree_auto_focus then
--     print("Nvim-tree auto-focus: ENABLED")
--   else
--     print("Nvim-tree auto-focus: DISABLED")
--   end
-- end
--
-- -- 3. Bind the toggle function to your preferred key mapping (e.g., <leader>tf)
-- vim.keymap.set("n", "<leader>tf", toggle_nvim_tree_focus, { desc = "Toggle Nvim-Tree Auto Focus" })



return nvim_tree
