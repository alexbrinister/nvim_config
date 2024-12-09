return {
    "leoluz/nvim-dap-go",
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    config = function()
        local dap = require('dap')

        dap.adapters.go = function(callback, config)
            local handle
            handle = function(req, resp)
                if resp.event == 'terminated' then
                    handle = nil
                end
                callback(req, resp)
            end

            -- TODO: detect ProjectRoot to get the port from the launched dap server
            local port = 38667 -- check the port number in the delve logs
            local host = '127.0.0.1'
            local addr = string.format('%s:%s', host, port)
            local opts = {
                command = { 'curl', '-s', string.format('http://%s/json/list', addr) },
                callback = handle
            }

            require('dap.process').run(opts)
        end

        dap.configurations.go = {
            {
                type = 'go',
                name = 'Debug',
                request = 'launch',
                program = '${file}',
            },
        }
    end
}
