return {
  -- AI coding assistant with chat sidebar
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = { "CodeCompanion", "CodeCompanionActions", "CodeCompanionChat" },
    opts = {
      adapters = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            env = { api_key = 'YOUR_API_KEY' },
          })
        end,
        openai = function()
          return require("codecompanion.adapters").extend("openai", {
            env = { api_key = 'YOUR_API_KEY' },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "anthropic",
        },
        inline = {
          adapter = "anthropic",
        },
      },
      display = {
        chat = {
          show_settings = true,
          show_token_count = true,
        },
      },
    },
    keys = {
      { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "AI Chat Toggle" },
      { "<leader>aA", "<cmd>CodeCompanionActions<cr>", desc = "AI Actions" },
      { "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "Inline AI", mode = { "n", "v" } },
    },
  },
}
