"------------------------ COC ----------------------- 
" coc for tslinting, auto complete and prettier
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} 

" coc extensions 
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier' ]
nnoremap <leader>p :CocCommand prettier.formatFile<CR>
nnoremap <leader>a :CocAction<CR>
let g:coc_status_error_sign = '█';
let g:coc_status_warning_sign = '█';

" Remap keys for gotos
au BufNewFile,BufRead *.tsx
         \ nmap <silent> gd :belowright vsplit \| call CocAction("jumpDefinition") <CR> |
         \ nmap <silent> gy :belowright vsplit \| call CocAction("jumpTypeDefinition") <CR> |
         \ nmap <silent> gi :belowright vsplit \| call CocAction("jumpImplementation") <CR> |
         \ nmap <silent> gr :belowright vsplit \| call CocAction("jumpReferences") <CR>


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" vim-tsx will do all the coloring for jsx in the .tsx file
Plug 'ianks/vim-tsx'

"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors "
" typescript-vim will do all the coloring for typescript keywords 
""Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'

"------------------------ THEME ------------------------ 
" most importantly you need a good color scheme to write good code :D
Plug 'dikiaap/minimalist'

"---------------------- DEBUGGING -----------------------

" == VIMPLUG END ================================ "
" == AUTOCMD ================================ "
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
