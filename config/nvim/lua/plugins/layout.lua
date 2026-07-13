return {
  -- VSCode-like persistent layout: left (file tree) | center (editor) | right (AI) + bottom (terminal)
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
      left = {
        {
          title = "Explorer",
          ft = "snacks_explorer",
        },
      },
      bottom = {
        {
          title = "Terminal",
          ft = "snacks_terminal",
          size = { height = 0.3 },
        },
      },
      right = {
        {
          title = "AI Chat",
          ft = "codecompanion",
        },
      },
      options = {
        left = { size = 30 },
        bottom = { size = 15 },
        right = { size = 40 },
      },
      -- animate window transitions
      animate = {
        enabled = true,
        duration = 10,
      },
    },
  },
}
