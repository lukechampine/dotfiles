" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" go fmt
autocmd BufWritePre *.go Fmt

" Set colors
colorscheme brushstrokes

" Set tab width
set tabstop=4
set shiftwidth=4
set expandtab

" Set gutter
set number
set numberwidth=3
highlight LineNr ctermfg=DarkGrey

" Get rid of that stupid timeout lag
set timeout ttimeoutlen=0

" Search highlighting
nnoremap <silent> ; :set invhlsearch<CR>
set viminfo+=/0
set incsearch

" F7 toggles spellcheck
map <F7> :setlocal spell! spelllang=en_us<CR>

" <Ctrl-n> opens NERDTree
map <C-n> :NERDTreeToggle<CR>

" Intelligent tab completion
inoremap <silent> <Tab> <C-r>=<SID>InsertTabWrapper(1)<CR>
inoremap <silent> <S-Tab> <C-r>=<SID>InsertTabWrapper(-1)<CR>
function! <SID>InsertTabWrapper(direction)
    let idx = col('.') - 1
    let str = getline('.')
    if a:direction > 0 && idx >= 2 && str[idx - 1] == ' '
            \&& str[idx - 2] =~? '[a-z]'
        if &softtabstop && idx % &softtabstop == 0
            return "\<BS>\<Tab>\<Tab>"
        else
            return "\<BS>\<Tab>"
        endif
    elseif idx == 0 || str[idx - 1] !~? '[a-z]'
        return "\<Tab>"
    elseif a:direction > 0
        return "\<C-p>"
    else
        return "\<C-n>"
    endif
endfunction
