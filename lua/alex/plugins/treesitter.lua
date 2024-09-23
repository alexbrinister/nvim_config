return {     
	"nvim-treesitter/nvim-treesitter",     
	build = ":TSUpdate",         
	config = function()
		require'nvim-treesitter.configs'.setup ({  
			ensure_installed = { 
				"c", 
				"cpp",
				"c_sharp", 
				"cmake", 	
				"css",
				"csv", 
				"html",
				"javascript",
				"json",
				"lua", 
				"make",
				"markdown",
				"typescript",
				"vim", 
				"vimdoc", 
				"xml",
				"yaml",
				"query" 
			},    
			sync_install = false,    
			auto_install = true,
			indent = {
				enable = true
			},
			highlight = {     
				enable = true,      
			},
		})
        
        vim.treesitter.language.register("templ", "templ")
	end
}	  
