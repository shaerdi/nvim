" Author: Simon Härdi 
"
call plug#begin()
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'scrooloose/nerdtree'
    Plug 'iCyMind/NeoSolarized'
    Plug 'tpope/vim-fugitive'
    Plug 'lervag/vimtex'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/nerdcommenter'
    Plug 'ervandew/supertab'
    Plug 'vim-scripts/DoxygenToolkit.vim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    Plug 'kshenoy/vim-signature'
    Plug 'airblade/vim-gitgutter'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'w0rp/ale'
    Plug 'davidhalter/jedi-vim'
    Plug 'christoomey/vim-tmux-runner'
call plug#end()
" 
" Vim Options:
"
" 
" Basics {
    au FocusGained,BufEnter * : silent! !
    set autoread            " If file in buffer is changed, vim reloads the buffer
" }
"
" General {
 	filetype plugin indent on   " Automatically detect file types.
	syntax enable               " Enables syntax highlighting
	set mouse=a                 " Enables mouse support
	set virtualedit=onemore     " Cursor can be positioned one position after last char
    set noea
    set title
    set inccommand=split
    vnoremap <LeftRelease> "*ygv
" }
"
" UI {
    set number              " Show line number
    set relativenumber
    set scrolloff=3         " At minimum 3 lines below cursor while scrolling
    set cursorline          " Highlight current Line
    set guifont=Inconsolata\ Medium\ 11
    set cc=80               " Highlight line 80 for code
" }
"
" Formatting {
    set foldlevel=99
	set autoindent                  " indent at the same level of the previous line
	set shiftwidth=4                " use indents of 4 spaces
	set tabstop=4                   " use indents of 4 spaces
	set expandtab                   " tabs are spaces, not tabs
    set tw=79                       " auto break at column 79
	set matchpairs+=<:>             " Add <> to available pairs
    au BufNewFile,BufRead *.lco set filetype=tex " Set tex highlighting for lco files
    au BufNewFile,BufRead *.m set filetype=matlab " Set matlab highlighting for m files
" }
" 
"  MixedThings {
    set ignorecase          " Ignore case when searching 
    set smartcase           " Ignores case only when searching an all lowercase word
    set gdefault            " Always replace all words on whole line
    nnoremap <silent> <space> :noh<cr>
" }
"
" Python {
    autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set cc=80
" }
"
" C++ {
    autocmd FileType cpp set cc=80
    au BufRead,BufNewFile *.C set filetype=cpp
    au BufRead,BufNewFile *.h set filetype=cpp
" }
"
" Latex {
    nnoremap <leader>oo :%s/Oe;/Ö/e <Bar> %s/Ae;/Ä/e <Bar> %s/Ue;/Ü/e <Bar> %s/oe;/ö/e <Bar> %s/ae;/ä/e <Bar> %s/ue;/ü/e<CR>
" }
"
" General Key Mappings {
    " Uppercase Y yanks from cursor to end of line
    nnoremap Y y$
    
    " Replace marked text with the actual buffer
    vmap r "_dP
    " Go back to normal mode typing jj
    inoremap jj <ESC>
    tnoremap jj <C-\><C-n>
    " Let ; do the same as :
    nnoremap ; :
    " Open a vertical Split window and switch to it
    nnoremap <leader>w <C-w>v<C-w>l
    
    inoremap <F8> <C-O>za
    inoremap <F8> za
    inoremap <F8> <C-C>za
    inoremap <F8> zf
    
    "ignore line wrapping when navigating
    nmap j gj
    nmap k gk
    
    "Make
    nnoremap <leader>sm :silent execute "!make >/dev/null &"<CR>
    
    "write as sudo
    cmap w!! w !sudo tee > /dev/null %
    
    "calculate marked expression
    vnoremap <leader>r c<C-r>=<C-r>"<CR><Esc>
    
    " switch windows with double ,
    nnoremap ,, <C-w>
" }
"
" Plugins {
" 	Solarized {
        set termguicolors
        colorscheme NeoSolarized
        set t_Co=256
        let g:solarized_termcolors=256
" 	}
"
" 	Nerdtree {
		map <F3> :NERDTreeToggle<cr>            " Toggle NerdTree
"	}
"
"	fugitive {
        nnoremap <leader>gst :Gstatus<cr>
"	}
"
"	SuperTab {
        let g:SuperTabDefaultCompletionType = "context"
        let g:SuperTapContextDefaultCompletionType = "<c-x><c-u>"
        let g:SuperTabClosePreviewOnPopupClose = 1
        let g:UltiSnipsExpandTrigger="<C-h>"
"	}
"
"   DoxygenToolkit {
	    let g:DoxygenToolkit_authorName="shaerdi"
"   }
"
"   Eclim {
        let g:EclimCompletionMethod = 'omnifunc'
        let g:EclimFileTypeValidate = 0
        nnoremap <leader><leader>s :CSearchContext<cr>
"   }
"
"   jedi-vim {
        let g:jedi#popup_on_dot = 0
"   }
"
"   deoplete {
        let g:deoplete#enable_at_startup = 1
        set completeopt=longest,menuone,preview
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        if !exists('g:deoplete#omni#input_patterns')
            let g:deoplete#omni#input_patterns = {}
        endif
        let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

"   }
"
"   vimtex {
        let g:vimtex_view_method='zathura'
        au BufNewFile,BufRead *.tex let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
        let g:vimtex_compiler_progname = 'nvr'
"   }
"
"   markdown {
        let g:mkdp_auto_start = 0
        let g:mkdp_auto_close = 0
"   }
"
"   vim-tmux-runner{
        let g:VtrStripLeadingWhitespace = 0
        let g:VtrClearEmptyLines = 0
        let g:VtrAppendNewline = 1
        let g:VtrOrientation = "h"
        let g:VtrPercentage = 40
        let g:VtrInitialCommand = "ipython3"
        nnoremap <leader>sl :VtrSendLinesToRunner<cr>
        nnoremap <leader>fr :VtrFocusRunner<cr>
        vnoremap <leader>sl :VtrSendLinesToRunner<cr>
"   }
" }
"
" Abbreviations {
	:ab #d #define
	:ab #i #include
	:ab #b /************************************************
	:ab #e ************************************************/
	:ab #l /*----------------------------------------------*/
" }
"
" Spell check {
    if has("autocmd")
        autocmd FileType tex set spell spelllang=de,en_us
    endif 
" }
"
