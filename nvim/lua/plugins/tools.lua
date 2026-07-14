return {
  -- 确保 Python/Rust 调试器已安装
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "debugpy", -- Python DAP
        "codelldb", -- Rust DAP (via lldb)
        "ruff", -- Python linter + formatter
        "basedpyright", -- Python LSP
        "rust-analyzer", -- Rust LSP
      })
    end,
  },
}
