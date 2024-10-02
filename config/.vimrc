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
colorscheme catppuccin_latte
let g:lightline = {'colorscheme': 'catppuccin_latte'}

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Set the statusline
set noshowmode
set laststatus=2
