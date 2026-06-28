return {
  "AlexvZyl/nordic.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nordic").setup({
      on_highlight = function(highlights, _palette)
        local comment = { fg = "#8a9387", italic = true }
        local hidden = { fg = "#5a6470", italic = true }
        highlights.Comment = comment
        highlights["@comment"] = comment
        highlights["@comment.documentation"] = comment
        highlights["@spell"] = comment
        highlights.NeoTreeDotfile = hidden
        highlights.NeoTreeHiddenByName = hidden
        highlights.NvimTreeHiddenFile = hidden
      end,
      bold_keywords = false,
      italic_comments = true,
      transparent = {
        bg = true,
        float = true,
      },
      bright_border = false,
      reduced_blue = true,
      swap_backgrounds = false,
      cursorline = {
        bold = false,
        bold_number = true,
        theme = "dark",
        blend = 0.85,
      },
      noice = {
        style = "classic",
      },
      telescope = {
        style = "flat",
      },
      leap = {
        dim_backdrop = false,
      },
      ts_context = {
        dark_background = true,
      },
    })
    require("nordic").load()
  end,
}
