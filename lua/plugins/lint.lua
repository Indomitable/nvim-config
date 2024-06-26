return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile"
  },
  config = function ()
    local lint = require("lint")
    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      vue = { "eslint_d" }
    }

    local lint_augroup = vim.api.nvim_create_augroup("ling", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      pattern = { "*.ts", "*.js", "*.vue" },
      group = lint_augroup,
      callback = function ()
        lint.try_lint()
      end
    })

    vim.keymap.set("n", "<leader>lf", function ()
      lint.try_lint();
    end, { desc = "Lint file" })
  end
}
