return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    colors = {
      error = { "DiagnosticError", "ErrorMsg", "#B74C4C" },
      warning = { "DiagnosticWarn", "WarningMsg", "#D1B754" },
      info = { "DiagnosticInfo", "#4A5EAB" },
      hint = { "DiagnosticHint", "#2D9C76" },
      default = { "Identifier", "#6D4C9A" },
      test = { "Identifier", "#D066D1" },
    },
  },
}
