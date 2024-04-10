return{
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		vim.keymap.set("n", "<leader>gp", vim.cmd.Git('push'))
		vim.keymap.set("n", "<leader>gP", vim.cmd.Git('pull'))
	end
}
