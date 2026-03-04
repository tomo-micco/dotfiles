return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "leoluz/nvim-dap-go",
        "NicholasMata/nvim-dap-cs",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("dap-go").setup()
        require("dap-cs").setup()
        dapui.setup()

        -- デバッグ開始・終了時に自動でUIを開閉する
        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

        -- キーバインド
        local keymap = vim.keymap
        keymap.set('n', '<F5>', function() dap.continue() end)
        keymap.set('n', '<F10>', function() dap.step_over() end)
        keymap.set('n', '<F9>', function() dap.toggle_breakpoint() end)
    end
}
