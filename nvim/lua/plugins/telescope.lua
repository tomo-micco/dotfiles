return {
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function()
            local telescope = require('telescope')
            local builtin = require('telescope.builtin')

            telescope.setup {
                defaults = {
                    theme = "ivy",
                },
                pickers = {
                    find_files = {
                        theme = "dropdown",
                    }
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    }
                }
            }

            telescope.load_extension('fzf')

            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
            -- search ~/dotconfig/nvim/
            vim.keymap.set('n', '<leader>fc', function()
                builtin.find_files {
                    cwd = vim.fn.stdpath("config")
                }
            end)
        end
    }
}
