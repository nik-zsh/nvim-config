require("dap").adapters.firefox = {
    type = "executable",
    command = "node",
    args = {
        vim.fn.stdpath("data") ..
            "/mason/packages/firefox-debug-adapter/dist/adapter.bundle.js"
    }
}

local dap = require("dap")

for _, adapterType in ipairs({"node", "chrome", "msedge"}) do
    local pwaType = "pwa-" .. adapterType

    dap.adapters[pwaType] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
            command = "node",
            args = {
                vim.fn.stdpath("data") ..
                    "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
                "${port}"
            }
        }
    }

    -- this allow us to handle launch.json configurations
    -- which specify type as "node" or "chrome" or "msedge"
    dap.adapters[adapterType] = function(cb, config)
        local nativeAdapter = dap.adapters[pwaType]

        config.type = pwaType

        if type(nativeAdapter) == "function" then
            nativeAdapter(cb, config)
        else
            cb(nativeAdapter)
        end
    end
end
