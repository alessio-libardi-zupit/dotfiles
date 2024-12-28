" Start vim-plug section
call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'itchyny/lightline.vim'

call plug#end()
" End vim-plug section

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Set the colorscheme
set termguicolors
let g:lightline = {'colorscheme': 'catppuccin_latte'}
colorscheme catppuccin_latte


" Set the statusline
set noshowmode
set laststatus=2
