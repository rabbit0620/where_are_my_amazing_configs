return {
  "3rd/image.nvim",
  build = false, -- 无需编译
  config = function()
    require("image").setup({
      backend = "kitty",
      kitty_method = "normal",
      integrations = {
        markdown = { enabled = true },
        -- 其它需要的文件类型
      },
      max_width = 100,
      max_height = 50,
    })
  end,
}
