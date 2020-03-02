let mapleader = ";"

" vim:foldmethod=marker:foldlevel=0
" config variables

" Load plugins{{{
" == VIM PLUG ================================ 
" Setup plugin manager
if has('unix')
   let g:nvim_config_dir = '~/.config/nvim'
   let g:nvim_plugged_dir = g:nvim_config_dir . '/plugged'
   let g:nvim_autoload_plugvim = g:nvim_config_dir . '/autoload/plug.vim'
   if empty(glob(g:nvim_autoload_plugvim))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
   endif
   call plug#begin(g:nvim_plugged_dir)
endif

if has('win32')
   let g:nvim_config_dir = '$LOCALAPPDATA\nvim'
   let g:nvim_plugged_dir = g:nvim_config_dir . '\plugged'
   let g:nvim_autoload_plugvim = g:nvim_config_dir . '\autoload\plug.vim'
   if empty(glob(g:nvim_autoload_plugvim))
      silent ! powershell (md "$env:LOCALAPPDATA\nvim\autoload")
      silent ! powershell curl 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' -Outfile ("$env:LOCALAPPDATA" + '\nvim\autoload\plug.vim')
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
   endif
   call plug#begin(g:nvim_plugged_dir)
endif

"" Languages
exec "source " . g:nvim_config_dir . '/plugin-configs/ts-react-stack.vim'
Plug 'LnL7/vim-nix'

"" Workflow plugins
""" NERDTree
Plug 'preservim/nerdtree'
nnoremap <leader>n :NERDTreeToggle<CR>
let NERDTreeShowBookmarks = 1

""" Unix like operations
Plug 'tpope/vim-eunuch'

""" CtrlP 
Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader><Space>' 
let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*/node_modules/*

""" Git
Plug 'jreybert/vimagit'

"" Theming plugins
""" PowerLine
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'molokai'
let g:airline_powerline_fonts = 1

""" Themes
Plug 'rafi/awesome-vim-colorschemes'


""" Tools
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/goyo.vim'
Plug 'gcmt/taboo.vim'

" == AUTOCMD END ================================
call plug#end()
"}}}

" Keymaps{{{

"" Buffer management
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gh <C-w>h
nnoremap gl <C-w>l

nnoremap gJ <C-w>J
nnoremap gK <C-w>K
nnoremap gH <C-w>H
nnoremap gL <C-w>L

nnoremap g= <C-w>=

nnoremap gn :split<CR>
nnoremap gv :vsplit<CR>

"" go to file in new buffer
nnoremap gf :belowright vsplit <cfile><CR>

""" Save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

"" Shortcuts
""" Edit config
nnoremap <leader>rc :tabnew $MYVIMRC<CR>
""" Load config
nnoremap <leader>vim :source $MYVIMRC<CR>
"}}}

"" Terminal keymaps
if has('win32')
   nnoremap <leader>t :belowright split \| terminal powershell<CR>
endif

if has('unix')
   nnoremap <leader>t :belowright split \| terminal zsh<CR>
endif
nnoremap <C-d> <C-\><C-n>

" General editor config{{{
"" 256 color support
"execute "set t_8f=\e[38;2;%lu;%lu;%lum"
"execute "set t_8b=\e[48;2;%lu;%lu;%lum"
"set termguicolors

"" Tabs and spaces
set tabstop=3       " number of visual spaces per TAB
set softtabstop=3   " number of spaces in tab when editing
set shiftwidth=3    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line

"" line numberings
set relativenumber
set number

"" line break
set nowrap
set linebreak " this will not break words when 'set wrap' is executed manually


" }}}

" Theming{{{
:colorscheme molokai

""" visual representation of stuff
set listchars=tab:\|·,trail:˽,extends:,precedes:,space:·,nbsp:%
set list

"}}}

