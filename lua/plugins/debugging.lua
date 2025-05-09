return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
        "jay-babu/mason-nvim-dap.nvim",
        -- "mxsdev/nvim-dap-vscode-js",
    },
    lazy = true,
    keys = require("keys.dap"),
    config = function()
        vim.keymap.set("n", "<Leader>du", function()
            require("dapui").open()
        end, {})
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

        dapui.setup({
            controls = {
                element = "repl",
                enabled = true,
                icons = {
                    disconnect = "",
                    pause = "",
                    play = "",
                    run_last = "",
                    step_back = "",
                    step_into = "",
                    step_out = "",
                    step_over = "",
                    terminate = "",
                },
            },
            element_mappings = {},
            expand_lines = true,
            floating = {
                border = "single",
                mappings = {
                    close = { "q", "<Esc>" },
                },
            },
            force_buffers = true,
            icons = {
                collapsed = "",
                current_frame = "",
                expanded = "",
            },
            layouts = {
                {
                    elements = {
                        -- {
                        --     id = "scopes",
                        --     size = 0.25,
                        -- },
                        {
                            id = "console",
                            size = 0.25,
                        },
                        {
                            id = "stacks",
                            size = 0.5,
                        },
                        -- {
                        --     id = "watches",
                        --     size = 0.25,
                        -- },
                    },
                    position = "left",
                    size = 0.001,
                },
                {
                    elements = {
                        {
                            id = "repl",
                            size = 0.7,
                        },
                        -- {
                        --     id = "console",
                        --     size = 0.5,
                        -- },
                    },
                    position = "bottom",
                    size = 10,
                },
            },
            mappings = {
                edit = "e",
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                repl = "r",
                toggle = "t",
            },
            render = {
                indent = 1,
                max_value_lines = 100,
            },
        })
        require("mason-nvim-dap").setup()
        require("debuggers-config.c-family")
        require("debuggers-config.javascript.js-lang-config")
        -- require("after.dapui")
    end,
}
