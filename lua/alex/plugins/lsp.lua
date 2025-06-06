return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/nvim-cmp",
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "nvimtools/none-ls.nvim",
        "lukas-reineke/lsp-format.nvim"
    },
    config = function()
        local lsp_zero = require('lsp-zero')
        lsp_zero.format_on_save({
            format_opts = {
                async = true,
                timeout_ms = 10000,
            },
            servers = {
                ['rustaceanvim'] = { 'rust' },
                ['clangd'] = { 'c', 'cpp' },
            }
        })

        -- lsp_attach is where you enable features that only work
        -- if there is a language server active in the file
        local lsp_attach = function(client, bufnr)
            local opts = { buffer = bufnr }

            vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
            vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
            vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
            vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
            vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
            vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
            vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
            vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
            vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
            vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

            -- autoformat on save
            require("lsp-format").setup {}
            require("lsp-format").on_attach(client, bufnr)
            vim.cmd [[cabbrev wq execute "Format sync" <bar> wq]]
        end

        lsp_zero.extend_lspconfig({
            sign_text = true,
            lsp_attach = lsp_attach,
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })
        require('mason').setup({
            ensure_installed = {
                "delve"
            },
            automatic_installation = true
        })
        require('mason-lspconfig').setup({
            ensure_installed = {
                "clangd",
                "gopls",
                "glsl_analyzer",
                "lua_ls",
                "ltex",
                "neocmake",
                "ols",
                "powershell_es",
                "pylsp",
                "zls",
                "cucumber_language_server",
                "jsonls",
                "yamlls",
                "gitlab_ci_ls",
                -- "hdl_checker",
                "azure_pipelines_ls",
                "arduino_language_server",
                "asm_lsp",
                "awk_ls",
                "bashls",
                "dockerls"
            },
            automatic_installation = true,
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
            },
        })
        local cmp = require('cmp')
        local cmp_action = lsp_zero.cmp_action()

        cmp.setup({
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
            },
            mapping = cmp.mapping.preset.insert({
                -- `Enter` key to confirm completion
                ['<CR>'] = cmp.mapping.confirm({ select = false }),

                -- Ctrl+Space to trigger completion menu
                ['<C-Space>'] = cmp.mapping.complete(),

                -- Navigate between snippet placeholder
                ['<C-f>'] = cmp_action.vim_snippet_jump_forward(),
                ['<C-b>'] = cmp_action.vim_snippet_jump_backward(),

                -- Scroll up and down in the completion documentation
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            }),
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
        })
    end
}
