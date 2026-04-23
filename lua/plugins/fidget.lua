return {
  "j-hui/fidget.nvim",
  event = "LspAttach",
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    progress = {
      display = {
        done_ttl      = 3,
        progress_icon = { "dots" },
      },
    },
    notification = {
      window = {
        align     = "bottom",
        relative  = "editor",
        x_padding = 1,
        y_padding = 0,
      },
    },
  },
  config = function(_, opts)
    require("fidget").setup(opts)
    require("telescope").load_extension("fidget")
  end,
}
