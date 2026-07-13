return {
  -- 让 LazyVim 启用 tinymist LSP 服务器
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tinymist = {},
      },
    },
  },

  -- typst-preview 实时预览（你已有类似配置）
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "*",
    build = function()
      require("typst-preview").update()
    end,
    config = function()
      require("typst-preview").setup({
        open_cmd = "firefox --new-window", -- 或你喜欢的浏览器
      })
    end,
  },
}
