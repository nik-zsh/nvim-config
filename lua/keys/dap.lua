M = {
    {
        "<Leader>dt",
        function() require("dap").toggle_breakpoint() end,
        desc = "debugger breakpoint"
    }, {
        "<Leader>dc",
        function() require("dap").continue() end,
        desc = "debugger start/continue"
    }
}

return M
