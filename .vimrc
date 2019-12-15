" minpac package manager
packadd minpac
call minpac#init()
call minpac#add('https://github.com/k-takata/minpac', {'type': 'opt'})
call minpac#add('https://github.com/junegunn/fzf.vim', {'type': 'opt'})
call minpac#add('https://github.com/itchyny/lightline.vim', {'type': 'opt'})
call minpac#add('https://github.com/scrooloose/nerdtree', {'type': 'opt'})
"call minpac#add('https://github.com/vim-airline/vim-airline', {'type': 'opt'})
packadd fzf.vim
packadd lightline.vim
packadd nerdtree
"packadd vim-airline

" fzf options
set rtp+=/usr/local/opt/fzf
map ; :Files<CR>

" NERDTree options
map <C-O> :NERDTreeToggle<CR>

" make lightline mode switching snappier
set ttimeout ttimeoutlen=50

" get rid of accidental trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" tell vim to allow you to copy between files, remember your cursor
" position and other little nice things like that
"set viminfo='100,\"2500,:200,%,n~/.viminfo

" configure visible tabs (enable with ':set list')
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" make the highlighting of tabs and other non-text less annoying
highlight SpecialKey ctermfg=19 guifg=#333333
highlight NonText ctermfg=19 guifg=#333333
highlight LineNr ctermfg=242

" Remapping the arrow keys in order to break bad habits
nnoremap <Left> <nop>
vnoremap <Left> <nop>
inoremap <Left> <nop>
cnoremap <Left> <nop>
nnoremap <Right> <nop>
vnoremap <Right> <nop>
inoremap <Right> <nop>
cnoremap <Right> <nop>
nnoremap <Up> <nop>
vnoremap <Up> <nop>
inoremap <Up> <nop>
cnoremap <Up> <nop>
nnoremap <Down> <nop>
vnoremap <Down> <nop>
inoremap <Down> <nop>
cnoremap <Down> <nop>

" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" the good old set of options, some of which probably are not needed
set nocompatible
filetype off
filetype plugin on
syntax on
set number
set relativenumber
set ruler
set laststatus=2
set noshowmode
set showmatch
set tabstop=2
set softtabstop=2
"set expandtab
set shiftwidth=2
set report=0
set visualbell
set mouse=a
set textwidth=0
set incsearch
set wildmenu
set wildmode=list:longest
map <C-X> :buffers<CR>

