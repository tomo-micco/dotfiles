vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = {buffer = ev.buf}
        local keymap = vim.keymap

        -- 定義・参照ジャンプ
        keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        keymap.set('n', 'gr', vim.lsp.buf.references, opts)

        -- 情報表示
        keymap.set('n', 'K', vim.lsp.buf.hover, opts)

        -- 修正・リネーム
        keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    end,
})
