"first handle plugins with Vundle
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'jackguo380/vim-lsp-cxx-highlight'
Plugin 'VundleVim/Vundle.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

Plugin 'chr4/nginx.vim'
Plugin 'vim-scripts/c.vim'
Plugin 'mattn/webapi-vim'
Plugin 'majutsushi/tagbar'
Plugin 'grailbio/bazel-compilation-database'
Plugin 'vim-syntastic/syntastic'

Plugin 'digitaltoad/vim-pug.git'
Plugin 'sunaku/vim-dasht'
Plugin 'tpope/vim-dispatch'

Plugin 'venantius/vim-cljfmt'
Plugin 'kien/rainbow_parentheses.vim'
"Sir Tim Pope
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-sexp-mappings-for-regular-people.git'
Plugin 'guns/vim-sexp.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-vividchalk'
Plugin 'tpope/vim-commentary'
Plugin 'ivalkeen/vim-simpledb'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim'

Plugin 'jiangmiao/auto-pairs'
Plugin 'bdauria/angular-cli.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'joaohkfaria/vim-jest-snippets'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'

Plugin 'elzr/vim-json'
Plugin 'ctrlpvim/ctrlp.vim'

" Track the engine.
Plugin 'SirVer/ultisnips'
"
" " Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" MarkDown stuff
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1



"
let g:UltiSnipsExpandTrigger="<C-b>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-m>"
:let g:html_indent_inctags = "html,body,head,tbody,main"


" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" "

Plugin 'gavocanov/vim-js-indent'           
Plugin 'jelera/vim-javascript-syntax'      
Plugin 'Quramy/vim-js-pretty-template'     
Plugin 'leafgarland/typescript-vim'        
Plugin 'rust-lang/rust.vim'                
Plugin 'timonv/vim-cargo'                  
Plugin 'metakirby5/codi.vim'               
Plugin 'skywind3000/asyncrun.vim'          
Plugin 'altercation/vim-colors-solarized'  
Plugin 'vim-scripts/SyntaxRange'           
Plugin 'tybenz/vimdeck'                    
Plugin 'alvan/vim-closetag'                
Plugin 'Shougo/vimproc.vim'                
Plugin 'Quramy/tsuquyomi'                  
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
call vundle#end()

"who knows; make sure this is after vundle#end
filetype plugin indent on
filetype plugin on

"use relativenumber and number
set relativenumber
set number

"toggle NERDTree off
nnoremap <Leader>l :NERDTreeToggle<CR>

" eslinter

" autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
set statusline=%f "tail of the filename"

let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'

"syntax checking
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
syntax enable

"set indent and tab stuff
set shiftwidth=2
set tabstop=2
set expandtab

"ruler line and history
set history=50
set ruler
set showcmd
set incsearch

"eh old thing
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set nohlsearch
endif


"don't clutter everything up with .swp
set noswapfile


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

" For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

"no clue
set laststatus=2
set cursorline

"scroll before hitting last line of buffer
set scrolloff=5
set encoding=utf-8

"favorite: jj is used to toggle normal mode
inoremap jj <Esc>
noremap : <;> 
noremap ; :

" Maps autocomplete to tab //not sure why i wanted this
"imap <Tab> <C-P>

"typescript stuff and markup
"autocmd FileType typescript JsPreTmpl html js

" jsx
let g:jsx_ext_required = 0

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set nohlsearch
endif

"don't clutter everything up with .swp
set noswapfile

"highlight menu colors
highlight Normal ctermbg=Black
highlight NonText ctermbg=Black
hi Pmenu ctermfg=15 ctermbg=Black
set guicursor+=a:blinkon0


set showcmd
set term=screen-256color
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"Dasht stuff
nnoremap <Leader>k :Dasht<Space>
nnoremap <Leader><Leader>k :Dasht!<Space>

" search related docsets
 vnoremap <silent> <Leader>K y:<C-U>call Dasht(getreg(0))<Return>

" search ALL the docsets
 vnoremap <silent> <Leader><Leader>K y:<C-U>call Dasht(getreg(0), '!')<Return>"

au BufNewFile,BufRead *.ejs set filetype=html


" command -nargs=* Make make <args> | cwindow 3
" nnoremap <Leader>j :Make<CR>

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'Cargo.toml'))},
        \ 'whitelist': ['rust'],
        \ })

let g:LanguageClient_autoStart = 1
nnoremap  gd :LspDefinition<CR>

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/.vim-lsp.log')
let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_quickfix = 1

" leader y to copy buffer to clipboard
noremap <Leader>y "*yy
colorscheme industry
nnoremap <F8> :TagbarToggle<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

autocmd BufEnter *.cc :setlocal filetype=cpp

if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
