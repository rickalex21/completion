

let enable_vim_lsp = 1





call plug#begin('~/.config/nvim/plugged')
		Plug 'hrsh7th/nvim-compe'
		Plug 'neovim/nvim-lspconfig'
		Plug 'sirver/UltiSnips'
call plug#end()

if enable_vim_lsp
lua <<EOF
	require'lspconfig'.vimls.setup{}
EOF
endif


let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/mysnippets']
"let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
"Don't have a way right now to turn off completion in a snippet: if in ultisnips tabstop then turn off nvim-compe.
let g:UltiSnipsJumpForwardTrigger = '<c-j>'


lua <<EOF
local buffers = {'lua','vim'}
	require'compe'.setup {
		enabled          = true,
		autocomplete     = true,
		debug            = false,
		min_length       = 3,
		preselect        = 'always', -- always select the first
		throttle_time    = 80, -- default is 80,
		source_timeout   = 400, -- default is 400,
		incomplete_delay = 400,
		max_abbr_width   = 100,
		max_kind_width   = 100,
		max_menu_width   = 100,
		documentation    = true,

		source = {
			path      = true,
			calc      = true,
			nvim_lsp  = true,
			nvim_lua  = true,
			spell     = false,
			buffer    = {filetypes = buffers},
			vsnip     = false,
			ultisnips = true,
		};
	}

vim.cmd [[
inoremap <silent><expr> <C-Y>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
]]
EOF



