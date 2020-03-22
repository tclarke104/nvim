set relativenumber
set noswapfile
set nonumber
set numberwidth=3
set hlsearch!
set confirm
set splitbelow
set linespace=3
set splitright
set nospell
set background=dark
set conceallevel=3
set concealcursor=nc
set spellsuggest =fast,5
set spell spelllang=en_us
set spellfile=~/.config/nvim/spell/en.utf-8.add
set ts=2 sts=2 sw=2 expandtab
set ignorecase
" 
"
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged' Avoid using standard Vim directory names like 'plugin'
"
call plug#begin('~/.vim/plugged')
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/reply.vim'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'dense-analysis/ale'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'plasticboy/vim-markdown'

" Initialize plugin system
call plug#end()


" Nerd Tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

nnoremap <C-N> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Navigate between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Highlights
hi Folded ctermbg=Black
hi clear SpellBad
hi SpellBad cterm=underline

" Mappings to move up and down faster
nnoremap J 10j
nnoremap K 10k
vnoremap J 10j
vnoremap K 10k

let g:tex_conceal = "abdmgs"
let g:vim_markdown_math = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_folding_disabled = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {}
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.vimwiki = ['buffer', 'ale', 'around']
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'

" let g:vimwiki_links_space_char = '_'
" let g:vimwiki_auto_header = 1
let g:vimwiki_table_mappings=0
let g:vimwiki_list = [{'path': '~/dev/step1-notes',
                      \ 'syntax': 'markdown', 
                      \'ext': '.md',
                      \}]
let g:pymode_lint=0
let g:pymode_rope=0
let g:pymode_rope_completion=0
let g:pymode_syntax=0

let g:pandoc#command#prefer_pdf = 1

let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_enabled = 0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsSnippetDirectories=["UltiSnips", "UserSnippets"]
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:mkdp_auto_close = 0
let g:mkdp_auto_start = 0

let g:mkdp_command_for_global = 0

let g:ale_python_auto_pipenv = 1
let g:ale_open_list = 0 
let g:ale_sign_error = ">"
let g:ale_sign_warning = "-"
let g:ale_linters = {
      \"markdown": ['markdownlint', 'textlint', 'remark-lint'],
      \"pandoc": ['markdownlint', 'textlint', 'remark-lint'],
      \"python": ["flake8", "pylint", "autopep8"],
      \}
let g:ale_set_quickfix = 0
let g:ale_linter_aliases = { 'pandoc':'markdown' }
let g:ale_fix_on_save = 0
let g:ale_fixers = {
      \ '*' : ['prettier', 'textlint', 'remove_trailing_lines', 'trim_whitespace' ]
      \}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#exclude_buffers = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='term'
"let g:airline_theme='base16_twlight'
let g:airline_section_a = ''
let g:airline_section_y = ''
let g:airline_skip_empty_sections = 1

let g:surround_98 = "**\r**"

let g:jedi#completions_enabled = 0


autocmd Filetype pandoc,markdown,vimwiki,vimwiki.markdown syn region inMark matchgroup=mTag concealends  start="<mark>" end="</mark>"
autocmd Filetype pandoc,markdown,vimwiki,vimwiki.markdown inoremap <buffer> .<Space> .<CR>
au FileType vimwiki set filetype=vimwiki.markdown
au FileType vimwiki.markdown UltiSnipsAddFiletypes markdown
autocmd BufLeave,FocusLost,CursorHold * silent! update
command! Conf execute ":e ~/.config/nvim/init.vim"

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

fu! Imgsave()
  let filename=expand("%:t")
  let img_name="images/" . localtime() . filename
  cd ~/dev/step1-notes
  execute "silent w" img_name
  call setreg("", ["![" . filename . "]" . "(../" .img_name . ")"])
  History
endfunction
if bufwinnr(1)
  nmap + <C-W>+
  nmap - <C-W>-
endif

au BufWinEnter *.png,*.jpeg,*.jpg :call Imgsave()


nmap <space> <Plug>(easymotion-W)
nmap <S-space> <Plug>(easymotion-B)
inoremap jk <Esc>
vnoremap jk <esc>
inoremap >> <Esc>>>la
imap <lt><lt> <Esc><<i
nnoremap <leader>b :Buffers<CR>
" Syntax Highlighting
nnoremap <leader>f :Files<CR>
nnoremap <leader>a :Rg<Space> 
nnoremap <Leader>e :Explore .<CR>
nnoremap <silent><Leader><Leader>r :botright Repl<CR>
nnoremap <silent><C-enter> :ReplSend<CR>
vnoremap <silent><C-enter> :ReplSend<CR>
" nnoremap <silent><tab> :bn<CR>
" nnoremap <silent><s-tab> :bp<CR>
nnoremap \s z=<C-C>

nnoremap <leader>r :w<CR> :botright terminal python -m ipdb %<CR>
" nnoremap <silent><leader>b :call append(line(".") - 1, 'import ipdb; ipdb.set_trace()')<CR>
nnoremap <F9> <Esc>:w<cr> :exec '!python' shellescape(@%, 1)<cr>
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
inoremap <M-b> **<Tab>
inoremap <M-i> *<Tab>
vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
nnoremap gr :call netrw#BrowseX(expand('%:p:h') . '/' . expand('<cfile>'), netrw#CheckIfRemote())<CR>
nnoremap \i :call Imgsave()<CR>
tnoremap jk <C-\><C-n>
nnoremap <M-m> :MarkdownPreview<CR>
nnoremap <leader>m :call GuiWindowFullScreen(1)<CR>
nnoremap <leader><leader>m :call GuiWindowFullScreen(0)<CR>
nnoremap <leader>t :tabnew \| term<CR>
nnoremap <silent>]c :cnext<CR>
nnoremap <silent>[c :cprevious<CR>
autocmd BufWinEnter '__doc__' setlocal bufhidden=delete
autocmd TermOpen * setlocal nospell
autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber

hi SpellBad gui=undercurl
au BufEnter * hi! link htmlBold Directory
au BufEnter * hi! link htmItalic Type
au BufEnter * hi! link inMark Search

set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Meslo\ LG\ S\ for\ Powerline
   endif
 endif

" function! MakeSession()
"   " let b:sessiondir = $HOME . "/repos/dotfiles/nvim/sessions" . getcwd()
"   let b:sessiondir =  "~/.config/nvim/sessions"
"   let b:filename = b:sessiondir . '/session.vim'
"   exe "mksession! " . b:filename
" endfunction

" function! LoadSession()
"   " let b:sessiondir = $HOME . "/repos/dotfiles/nvim/sessions" . getcwd()
"   let b:sessiondir = $HOME . "/repos/dotfiles/nvim/sessions"
"   let b:sessionfile = b:sessiondir . "/session.vim"
"   if (filereadable(b:sessionfile))
"     exe 'source ' b:sessionfile
"   else
"     echo "No session loaded."
"   endif
" endfunction

" Adding automatons for when entering or leaving Vim
"nnoremap <leader><leader>l :call LoadSession()
au VimLeave * :call MakeSession()
ca tn tabnew
ca tc tabclose
"au VimEnter * cd ~/repos
"if !hasmapto('VimwikiReturn', 'i')
"  if maparg('<CR>', 'i') !~? '<Esc>:VimwikiReturn'
"    "inoremap <silent><buffer> <CR> <Esc>:VimwikiReturn 1 5<CR>
"    " ### I CHANGED THE ABOVE LINE TO THIS... ####
"    " Avoid interfering with popup/completion menu if it's active
"    inoremap <expr><silent><buffer> <CR> pumvisible() ? "\<CR>" : "\<Esc>:VimwikiReturn 1 5\<CR>"
"  endif
"  if maparg('<S-CR>', 'i') !~? '<Esc>:VimwikiReturn'
"    inoremap <silent><buffer> <S-CR> <Esc>:VimwikiReturn 2 2<CR>
"  endif
"endif
