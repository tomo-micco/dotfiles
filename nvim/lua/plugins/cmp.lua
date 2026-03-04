return {
    "hrsh7th/nvim-cmp",
    depenedencies = {
        "hrsh7th/cmp-nvim-lsp", -- LSPからの補完
        "hrsh7th/cmp-path", -- ファイルパスの保管
        "hrsh7th/cmp-buffer", -- 開いているファイルないの単語補完
        "windwp/nvim-autopairs" -- 括弧の自動挿入連携
    },
    config = function()
        local cmp = require("cmp")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")

        cmp.setup({
            -- 補完ソースの設定
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "buffer" },
            }),
            -- キーバインド
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true}),
            }),
        })

        -- autopairsとの連携：関数確定時に（）をつける
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
}
