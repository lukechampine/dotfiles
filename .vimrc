" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" Set tab width
set tabstop=4
set shiftwidth=4
set expandtab

" Get rid of that stupid timeout lag
set timeout ttimeoutlen=0

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
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
