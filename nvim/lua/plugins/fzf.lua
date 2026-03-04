return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local fzf = require("fzf-lua")
            fzf.setup({
                winopts = {
                    preview = { layout = "vertical" },
                },
            })

            local keymap = vim.keymap
            keymap.set("n", "<leader>ff", fzf.files, { desc = "Find Files" })
            keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live Grep" })
            keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find Buffers" })
            keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help Tags" })
        end,
    },
}
