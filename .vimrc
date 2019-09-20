set number
set noshowmode
set mouse=a
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray
let &path.="src/includes,/usr/include/AL,includes"
set list listchars=tab:>-,trail:.,extends:>,precedes:<
execute pathogen#infect()
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
map <C-o> :NERDTreeToggle<CR>
let g:NERDTreeNodeDelimiter = "\u00a0"
map <F6> :!clear;norminette -R CheckForbiddenSourceHeader % <CR>
map <S-F6> :!clear;gcc % && ./a.out <CR>
map <S-F5> gg=G<C-o><C-o>
filetype plugin indent on
set cindent
autocmd BufEnter * lcd %:p:h
set fillchars+=vert:│

nnoremap <Down> :echoe "Use j"<CR> 
nnoremap <Up> :echoe "Use k"<CR> 
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Left> :echoe "Use h"<CR>

" Protect changes between writes. Default values of
" updatecount (200 keystrokes) and updatetime
" (4 seconds) are fine
set swapfile
set directory^=~/.vim/swap//

" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto
" patch required to honor double slash at end
if has("patch-8.1.0251")
	" consolidate the writebackups -- not a big
	" deal either way, since they usually get deleted
	set backupdir^=~/.vim/backup//
end

" persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo//
