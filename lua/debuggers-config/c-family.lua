local dap = require("dap")
dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = {"--interpreter=dap", "--eval-command", "set print pretty on"}
}

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = vim.fn.exepath('codelldb'),
        args = {'--port', '${port}'}
    }
}
dap.configurations.c = {
    {
        name = "Launch - GDB",
        type = "gdb",
        request = "launch",
        console = "integratedTerminal",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/",
                                "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false
    }, {
        name = "Select and attach to process GDB",
        type = "gdb",
        request = "attach",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/",
                                "file")
        end,
        pid = function()
            local name = vim.fn.input("Executable name (filter): ")
            return require("dap.utils").pick_process({filter = name})
        end,
        cwd = "${workspaceFolder}"
    }, {
        name = "Attach to gdbserver :1234 GDB",
        type = "gdb",
        request = "attach",
        target = "localhost:1234",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/",
                                "file")
        end,
        cwd = "${workspaceFolder}"
    }, {
        name = 'LLDB: Launch',
        type = 'codelldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/',
                                'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
        console = 'integratedTerminal'
    }
}
