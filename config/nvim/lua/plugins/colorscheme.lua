return {
  "nasccped/rustheme.nvim",
  lazy = false, -- 建议设为 false，确保启动时加载
  priority = 1000, -- 确保它在其他插件前加载
  config = function()
    -- 在此处可以进行可选的设置，例如选择变体
    -- vim.cmd.colorscheme("rustheme")
    -- 或者如果你想使用特定的 variant:
    -- require("rustheme").setup({ variant = "mangrove_dark" })
    vim.cmd.colorscheme("rustheme")
  end,
}
