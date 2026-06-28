return {
  {
    "neanias/everforest-nvim",
    version = false, -- track latest
    lazy = false, -- load on startup
    priority = 1000, -- load early so colors are ready
    opts = {
      version = false,
      lazy = false,
      priority = 1000,
      background = "hard",
      transparent_background_level = 1,
      italics = true,
      disable_italic_comments = false,
      inlay_hints_background = "dimmed",
    },
    config = function(_, opts)
      require("everforest").setup(opts)
    end,
  },
}
