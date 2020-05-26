""" Yutyo's vimrc - Unapologetically KISS - Just a .vimrc config


"" General
set number      " Show line numbers
set relativenumber      " Show numbers relative to the current line
syntax on       " Enable syntax highlighting
set linebreak   " Break lines at word (requires Wrap lines)
set showbreak=+++       " Wrap-broken line prefix
set textwidth=100       " Line wrap (number of cols)
set showmatch   " Highlight matching brace
set visualbell  " Use visual bell (no beeping)
set mouse=a     " Enable use of the mouse for all modes

set laststatus=2        " Show the current file at the bottom

set title       " Title of the current file displayed at the tab
set showtabline=2       " Show vim tab pages all time

set hlsearch    " Highlight all search results
set smartcase   " Enable smart-case search
set ignorecase  " Always case-insensitive
set incsearch   " Searches for strings incrementally

set autoindent  " Auto-indent new lines
set expandtab   " Use spaces instead of tabs
set shiftwidth=4        " Number of auto-indent spaces
set smartindent " Enable smart-indent
set smarttab    " Enable smart-tabs
set softtabstop=4       " Number of spaces per Tab

set cursorline  " Autohighlight the line you are currently on
set showcmd     " Show command in bottom bar
set cmdheight=2 " More space to display commands
filetype indent on      " Load filetype-specific indent files
set wildmenu    " Visual autocomplete for command menu
set wildmode=list:full    "Expands wildmenu
set showmatch   " highlight matching [{()}]

set incsearch   " search as characters are entered
set hlsearch    " highlight matches


"" Advanced
set ruler       " Show row and column ruler information

set undolevels=1000     " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour

set nobackup   " No backup
set nowritebackup       " No backup

set clipboard=unnamed   " Saves copied text from vim to general clipboard
set clipboard=unnamedplus       " Saves copied text from vim ro general clipboard

" Shortcuts for generic commands as alias to vim commands
:map <C-a> GVgg                   
" Select all 
:map <C-n> :enew                  
" Open new file 
:map <C-o> :e . <Enter> 
" Open file
:map <C-s> :w <Enter>   
" Save file (use ctrl q afterwards)
:map <C-c> y           
" Copy
:map <C-v> p           
" Paste
:map <C-x> d            
" Cut
:map <C-z> u            
" Undo
:map <C-t> :tabnew <Enter>      
" Open new tab within vim
:map <C-i> >>           
" Move line
:map <C-w> :close <Enter>       
" Close the tab
:map <C-W> :q! <Enter>  
" Quit vim and close the window
:map <C-f> /            
" Search
:map <F3> n             
" Search the latest action 
:map <C-h> :%s/         
" Search and replace syntax
:map <S-t> vat          
" Enter visual mode 
:map <S-T> vit          
" Enter visual mode 
:map <S-{> vi{          
" Vi command {
:map <S-(> vi(          
" Vi command ( 
:map <S-[> vi[          
" Vi command [
:map <S-Right> gt       
" Switch to the nex tab page
:map <S-Left> gT        
" Switch to the prior tab page

cnoremap kj <C-C> 
" Easy navigation within the file
cnoremap jk <C-C> 
" Easy navigation within the file


"" Theme
colorscheme industry    " Default theme (change here for your preference)
highlight LineNr ctermfg=lightgray ctermbg=black


"" Statusline
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%#StatusLineNC#
set statusline+=%F
set statusline+=%m\
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\  
set statusline+=\ TIME:
set statusline+=\ %{strftime('%H:%M')}

" Toggle Lexplore with Ctrl-E
com!  -nargs=* -bar -bang -complete=dir  Lexplore  call netrw#Lexplore(<q-args>, <bang>0)

fun! Lexplore(dir, right)
  if exists("t:netrw_lexbufnr")
  " close down netrw explorer window
  let lexwinnr = bufwinnr(t:netrw_lexbufnr)
  if lexwinnr != -1
    let curwin = winnr()
    exe lexwinnr."wincmd w"
    close
    exe curwin."wincmd w"
  endif
  unlet t:netrw_lexbufnr

  else
    " open netrw explorer window in the dir of current file
    " (even on remote files)
    let path = substitute(exists("b:netrw_curdir")? b:netrw_curdir : expand("%:p"), '^\(.*[/\\]\)[^/\\]*$','\1','e')
    exe (a:right? "botright" : "topleft")." vertical ".((g:netrw_winsize > 0)? (g:netrw_winsize*winwidth(0))/100 : -g:netrw_winsize) . " new"
    if a:dir != ""
      exe "Explore ".a:dir
    else
      exe "Explore ".path
    endif
    setlocal winfixwidth
    let t:netrw_lexbufnr = bufnr("%")
  endif
endfun
