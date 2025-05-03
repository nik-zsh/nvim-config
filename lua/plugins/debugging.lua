return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text", "jay-babu/mason-nvim-dap.nvim"
        -- "mxsdev/nvim-dap-vscode-js",
    },
    lazy = true,
    keys = require("keys.dap"),
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        dapui.setup()
        require("mason-nvim-dap").setup()
        require("debuggers-config.c-family")
        require("debuggers-config.javascript.js-lang-config")
        -- require("after.dapui")
    end
}
