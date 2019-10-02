"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set number
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" leader
let mapleader=' '

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search & Replace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <leader>f find all
" <leader>fh find here
" <leader>fc find in cpp
" <leader>fx find in xml
" <leader>ff find in file

nnoremap <silent> <leader>f :Ack! <CR>
nnoremap <silent> <leader>fh :execute 'Ack '.expand('<cword>').' '.expand('%') <CR>

" Developer search commands
nnoremap <leader>ff :Ack <C-r><C-w> --
nnoremap <silent> <leader>fc :execute 'Ack '.expand('<cword>').' --cpp' <CR>
nnoremap <silent> <leader>fx :execute 'Ack '.expand('<cword>').' --xml' <CR>
nnoremap <silent> <leader>ft :Tags <CR>

" Searching in visual mode
vnoremap <silent> <leader>f y:Ack '<C-R>"'<CR>
vnoremap <silent> <leader>fh y:Ack '<C-R>"' %<CR>
vnoremap <leader>ff y:Ack '<C-R>"' --
vnoremap <silent> <leader>fc y:Ack '<C-R>"' --cpp<CR>
vnoremap <silent> <leader>fx y:Ack '<C-R>"' --xml<CR>


" find and replace all complete word only :%s/<foo>/bar/g
nnoremap <Leader>fr :%s/\<<C-r><C-w>\>//gcI<Left><Left><Left><Left>

" Grep options
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.fzf
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs & Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <Tab> gt
" nnoremap <S-Tab> gT

" Use Tab to navigate buffers
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
" nnoremap <silent> <S-t> :tabnew<CR>

nnoremap <silent> <leader>b :CtrlPBuffer<CR>
nnoremap <silent> <leader>e :Files<CR>

"" Close buffer
noremap <leader>c :bd<CR>
noremap <leader>cc :bd!<CR>
noremap <leader>cx :qa!<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <Leader>sh :<C-u>split<CR>
noremap <Leader>sv :<C-u>vsplit<CR>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Write & quit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easier write
" w write
" wq write quit
nmap <leader>w :w!<cr>
nmap <leader>wq :wq!<cr>

" easier quit
" q quit
" wn write none and quit
" qq slows down every quit so not using it, use wn instead
nmap <leader>q :q<cr>
nmap <leader>wn :q!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Escaping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert to normal with 
:inoremap kj <Esc>  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <silent> <F8> <C-]>
noremap <silent> gd <C-]>
noremap <silent> <F7> <C-t>
noremap <silent> gb <C-t>
noremap <silent> <F7><F8> :!ctags -R --tag-relative=yes -f ./tags~ .<CR>
set tags=./tags;,./tags~;,./.git/tags;
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => clang-format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_format#detect_style_file = 1

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR><Paste>


"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
let vimplug_exists=expand('~/.vim_runtime/autoload/plug.vim')

let g:vim_bootstrap_langs = ""
let g:vim_bootstrap_editor = "vim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim_runtime/my_plugins'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'lifepillar/vim-solarized8'
Plug 'majutsushi/tagbar'
Plug 'rhysd/vim-clang-format'
set rtp+=~/bin/fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
