return {
    {
        "rcarriga/nvim-notify",
        lazy = false,
        priority = 1000,
        config = function()
            require("notify").setup({
                background = "#000000",
            })
        end,
    },
    {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        priority = 900,
        config = function()
            require('nordic').setup({
                transparent = {
                    bg = true,
                    float = true,
                },
                cursorline = {
                    transparent = true,
                },
            })
            require('nordic').load()
        end,
    },
}
