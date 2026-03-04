-- load options
vim.g.mapleader = " "

require("options")
require("config.lazy")
require("config.keymaps")

-- auto-format
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

-- auto-read
vim.opt.autoread = true

-- 特定のイベントでチェックを実行
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    pattern = "*",
    command = "if mode() != 'c' | checktime | endif",
})

-- リアルタイムで監視するための設定
-- 4秒間入力がない場合に自動でチェックを走らせる
vim.opt.updatetime = 4000
