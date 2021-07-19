" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'

Plug 'brooth/far.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'cjuniet/clang-format.vim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/nvim-bufferline.lua'

Plug 'wincent/ferret'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Or build from source code by using yarn: https://yarnpkg.com
"Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" Initialize plugin system
call plug#end()



set tabstop=2
" when indenting with '>', use 4 spaces width"
 set shiftwidth=2
" On pressing tab, insert 4 spaces "
set expandtab

set number relativenumber

" NERDTree
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeRespectWildIgnore=1
let NERDTreeAutoDeleteBuffer=1
"let NERDTreeDirArrowExpandable="~"
"let NERDTreeDirArrowCollapsible="+"
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.swo,*.swn,*.class,*.hg,*.DS_Store,*.min.*,.git,.cache
filetype plugin on
autocmd FileType nerdtree setlocal relativenumber
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Markdown Preview
" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

nmap <silent> <C-w>- :sp<Return>
nmap <silent> <C-w>\| :vs<Return>
nmap <C-w>s :w<Return>
nmap <silent> <C-b> :NERDTreeToggle<Return>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nmap <silent> <C-c>k <Plug>(coc-diagnostic-prev)
nmap <silent> <C-c>j <Plug>(coc-diagnostic-next)
nmap <silent> <C-c>f <Plug>(coc-fix-current)
nmap <silent> <C-f> :Rg<Return>
nmap <silent> <C-d> :FZF<Return>
nmap <silent> <C-b> :BLines<Return>
nmap <silent> <C-k> :ClangFormat<Return>

"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='deus'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = 1

set ignorecase
set smartcase

" use <c-space>for trigger completion
inoremap <silent><expr> <C-space> coc#refresh()

" Use <Tab> and <S-Tab> to navigate the completion list:

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <S-y> pumvisible() ? coc#_select_confirm() : "<S-y>"
