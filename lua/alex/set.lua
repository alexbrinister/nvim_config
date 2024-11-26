vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "120"
vim.opt.textwidth = 119

vim.g.have_nerd_font = true

vim.opt.showmatch = true

vim.opt.backspace = "indent,eol,start"

vim.opt.backup = false

vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.cursorline = true

vim.opt.ttyfast = true

vim.opt.spell = true

vim.opt.autoindent = true

vim.opt.number = true

vim.opt.exrc = true
vim.opt.secure = true

if vim.fn.has('win32') == 1 then
    vim.o.shellcmdflag =
    '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
    vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    vim.o.shellquote = ''
    vim.o.shellxquote = ''

    vim.o.shell = 'pwsh'
end
