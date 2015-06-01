"Vundle
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

Plugin 'tpope/vim-fugitive'
Plugin 'ctrlp.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-markdown'
Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Gundo'
Plugin 'Markdown'
Plugin 'ack.vim'
Plugin 'coffee-check.vim'
Plugin 'vim-coffee-script'
Plugin 'The-NERD-tree'
Plugin 'rails.vim'
Plugin 'scratch.vim'
Plugin 'desert-warm-256'
Plugin 'github-theme'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'fatih/vim-go'
Plugin 'rizzatti/dash.vim'
Plugin 'wting/rust.vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/gem-ctags'
Plugin 'toothrot/vim-rspec'
Bundle 'slim-template/vim-slim.git'

call vundle#end()            " required

filetype plugin indent on     " required!

set tabstop=2
set shiftwidth=2
syntax enable
highlight Comment cterm=italic
colorscheme desert-warm-256
set softtabstop=2
set expandtab
set number
set history=1000
set linebreak

set wildmenu

"set list
" set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace


set showmatch
map ,b :CtrlPBuffer<CR>
map \| :NERDTreeToggle<CR>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

let g:ctrlp_clear_cache_on_exit = 1

" neocomplcache {
        let g:acp_enableAtStartup = 0
        let g:neocomplcache_enable_at_startup = 0
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_underbar_completion = 1
        let g:neocomplcache_enable_auto_delimiter = 1
        let g:neocomplcache_max_list = 15
        let g:neocomplcache_force_overwrite_completefunc = 1

        " SuperTab like snippets behavior.
        imap <silent><expr><TAB> neosnippet#expandable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
            \ "\<C-e>" : "\<TAB>")
        smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

        " Define dictionary.
        let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

        " Define keyword.
        if !exists('g:neocomplcache_keyword_patterns')
            let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns._ = '\h\w*'

        " Plugin key-mappings.
        imap <C-k> <Plug>(neosnippet_expand_or_jump)
        smap <C-k> <Plug>(neosnippet_expand_or_jump)
        inoremap <expr><C-g> neocomplcache#undo_completion()
        inoremap <expr><C-l> neocomplcache#complete_common_string()
        inoremap <expr><CR> neocomplcache#complete_common_string()

        " <TAB>: completion.
        inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

        " <CR>: close popup
        " <s-CR>: close popup and save indent.
        inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
        inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y> neocomplcache#close_popup()

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

        " Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
            let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
        let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

        " use honza's snippets
        let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

        " For snippet_complete marker.
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif
     " }

"highlight Comment cterm=italic

let g:rspec_runner = "os_x_iterm"
" RSpec.vim mappings
map ,t :call RunCurrentSpecFile()<CR>
map ,s :call RunNearestSpec()<CR>
map ,l :call RunLastSpec()<CR>
map ,a :call RunAllSpecs()<CR>
