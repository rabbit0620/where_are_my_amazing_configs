return {
  -- 1. 语法高亮
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "bash", "lua", "markdown", "markdown_inline", "python", "rust", "yaml" },
      highlight = { enable = true },
    },
  },
  -- 2. Markdown 渲染
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      enabled = true,
    },
  },
}
