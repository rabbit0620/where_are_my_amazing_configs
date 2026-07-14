return {
  -- 原有的 lspsaga 配置保持不变
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({})
    end,
    keys = {
      { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover Documentation" },
    },
  },

  -- 新增：配置 tinymist LSP 服务器
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tinymist = {},
      },
    },
  },
}
