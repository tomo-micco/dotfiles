return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "leoluz/nvim-dap-go",
        "NicholasMata/nvim-dap-cs",
        "theHamsta/nvim-dap-virtual-text",
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("mason-nvim-dap").setup({
            -- デバッガの自動インストール設定
            ensure_installed = { "delve", "netcoredbg" },
            automatic_installation = true,
        })

        require("nvim-dap-virtual-text").setup({})
        require("dap-go").setup()
        require("dap-cs").setup()
        dapui.setup()

        -- デバッグ開始・終了時に自動でUIを開閉する
        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

        -- アイコンの設定
        vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
        vim.fn.sign_define('DapBreakpointCondition', { text = '●', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
        vim.fn.sign_define('DapLogPoint', { text = '◆', texthl = 'DapLogPoint', linehl = '', numhl = '' })
        vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DapStopped', linehl = 'DapStoppedLine', numhl = 'DapStoppedLine' })

        -- ハイライトの設定
        vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#e06c75' })
        vim.api.nvim_set_hl(0, 'DapBreakpointCondition', { fg = '#98c379' })
        vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#61afef' })
        vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#98c379' })
        vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#31353f' })

        -- キーバインド (Fキー)
        local keymap = vim.keymap
        keymap.set('n', '<F5>', function() dap.continue() end, { desc = "Debug: Start/Continue" })
        keymap.set('n', '<F10>', function() dap.step_over() end, { desc = "Debug: Step Over" })
        keymap.set('n', '<F11>', function() dap.step_into() end, { desc = "Debug: Step Into" })
        keymap.set('n', '<F12>', function() dap.step_out() end, { desc = "Debug: Step Out" })
        keymap.set('n', '<F9>', function() dap.toggle_breakpoint() end, { desc = "Debug: Toggle Breakpoint" })

        -- キーバインド (leaderキー)
        keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end, { desc = "Debug: [B]reakpoint" })
        keymap.set('n', '<leader>dc', function() dap.continue() end, { desc = "Debug: [C]ontinue" })
        keymap.set('n', '<leader>di', function() dap.step_into() end, { desc = "Debug: Step [I]nto" })
        keymap.set('n', '<leader>do', function() dap.step_over() end, { desc = "Debug: Step [O]ver" })
        keymap.set('n', '<leader>dt', function() dap.terminate() end, { desc = "Debug: [T]erminate" })
        keymap.set('n', '<leader>du', function() dapui.toggle() end, { desc = "Debug: Toggle [U]I" })
    end
}
