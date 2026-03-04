return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "vtsls", "gopls", "csharp_ls" },
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(ev)
                    local opts = { buffer = ev.buf }

                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                end,
            })

            -- Goの設定
            vim.lsp.config("gopls", {
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
            })
            vim.lsp.enable("gopls")

            -- C#の設定
            vim.lsp.config("csharp_ls", {
                cmd = { "csharp-language-server" },
                filetypes = { "cs" },
            })
            vim.lsp.enable("csharp_ls")

            vim.lsp.config("lua_ls", {
                cmd = { "lua-language-server" },
                filetypes = { "lua" },
            })

            vim.lsp.enable("lua_ls")
            vim.lsp.enable("vtsls")
        end,
    },
}
