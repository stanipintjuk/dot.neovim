let mapleader = ";"

" vim:foldmethod=marker:foldlevel=0
" config variables

" Load plugins{{{
" == VIM PLUG ================================ 
" Setup plugin manager
if has('unix')
   set shell=zsh
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
   set shell=cmd
   if empty(glob(g:nvim_autoload_plugvim))
      silent ! powershell (md "$env:LOCALAPPDATA\nvim\autoload")
      silent ! powershell curl 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' -Outfile ("$env:LOCALAPPDATA" + '\nvim\autoload\plug.vim')
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
   endif
   call plug#begin(g:nvim_plugged_dir)
endif

"" Languages
silent! exec "source " . g:nvim_config_dir . '/plugin-configs/ts-react-stack.vim'
Plug 'LnL7/vim-nix'

"" Workflow plugins
""" NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
let NERDTreeShowBookmarks = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "○",
    \ "Staged"    : "●",
    \ "Untracked" : "◊",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "◍",
    \ "Clean"     : "●",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', 'none')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('md', 'lightBlue', 'none', '#3366FF', 'none')
call NERDTreeHighlightFile('ts', 'cyan', 'none', 'cyan', 'none')
call NERDTreeHighlightFile('tsx', 'cyan', 'none', 'cyan', 'none')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', 'none')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', 'none')
call NERDTreeHighlightFile('jpg', 'lightred', 'none', 'lightred', 'none')
call NERDTreeHighlightFile('jpeg', 'lightRed', 'none', 'lightRed', 'none')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'none')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', 'none')

"call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'none')
"call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', 'none')
"call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', 'none')
"call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', 'none')
"call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', 'none')

""" Unix like operations
Plug 'tpope/vim-eunuch'

""" Fzf
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
nnoremap <silent> <leader><Space> :FZF<CR>

""" Git
Plug 'tpope/vim-fugitive'

"" Theming plugins
""" PowerLine
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'molokai'
let g:airline_powerline_fonts = 1

"""" Themes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'Yggdroot/indentLine'
let g:indentLine_char = "▏"
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_first_char = "▏"

"""" Some nice icons
Plug 'ryanoasis/vim-devicons'
set encoding=utf8

""" Tools
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/goyo.vim'

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

nnoremap <silent> gn :split<CR>
nnoremap <silent> gv :vsplit<CR>

"" go to file in new buffer
nnoremap gf :belowright vsplit <cfile><CR>

""" Save and quit
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :q<CR>

"" Shortcuts
""" Edit config
nnoremap <silent> <leader>rc :tabnew $MYVIMRC<CR>
""" Load config
nnoremap <silent> <leader>vim :source $MYVIMRC<CR>

"" Terminal keymaps
nnoremap <leader>t :belowright split \| terminal<CR>

tnoremap <C-d> <C-\><C-n>
"}}}

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
:colorscheme PaperColor

""" visual representation of stuff
set listchars=tab:\|·,trail:˽,extends:,precedes:,space:\ ,nbsp:%

""" Dont show stuff in terminal and help
autocmd TermOpen * set nonumber | set norelativenumber
autocmd TermOpen * IndentLinesDisable

autocmd FileType help IndentLinesDisable
autocmd FileType colortest.vim IndentLinesDisable
set list
"}}}

