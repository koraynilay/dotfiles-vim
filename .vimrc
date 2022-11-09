" from https://www.reddit.com/r/vim/comments/kk4ech/regex_snippets_without_plugins/gh0burg?utm_source=share&utm_medium=web2x&context=3
function! Snip(snips) abort
        for [ regex, result, remove ] in a:snips
                let before_cursor = getline('.')[:col('.') - 2]
                let matched = matchstr(before_cursor, '\v\C' . regex . '$')
                echom matched
                if !empty(matched)
                        if remove
                                call feedkeys(repeat("\b", strlen(matched)), 'n')
                        endif
                        call feedkeys(result, 'n')
                endif
        endfor
endfunction

function! TestSnips() abort
        " [ 'pattern before cursor', 'key sequence to execute', 'remove match' ]
        call Snip([[ '([^,][0-9]+(,[0-9]{2})?)@<=eur', '€', 1 ],
        \          [ '([^.][0-9]+(\.[0-9]{2})?)@<=gbp', "\<ESC>Bi£\<ESC>Ea", 1 ],
        \          [ '([^.][0-9]+(\.[0-9]{2})?)@<=usd', "\<ESC>Bi$\<ESC>Ea", 1 ]])
endfunction

augroup Snippets
        autocmd!
        autocmd TextChangedI * call TestSnips()
augroup END
"


set backspace=indent,eol,start

set history=1000		" keep 200 lines of command line history
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set wildmenu			" display completion matches in a status line

set to
set tm=300
"set ttimeout			" time out for key codes
"set ttimeoutlen=10		" wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.
set scrolloff=2

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Only do this part when Vim was compiled with the +eval feature.
if 1

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END

endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif

set clipboard=unnamedplus
set number
filetype plugin on

function! StatuslineMode()
  let l:mode=mode()
  if l:mode=~?"n"
    return "NORMAL"
  elseif l:mode=~?"i"
    return "INSERT"

  elseif l:mode=~?"v"
    return "VISUAL"
  elseif l:mode=~?"V"
    return "V-LINE"
  elseif l:mode=~?"CTRL-V"
    return "V-BLOCK"

  elseif l:mode=~?"s"
    return "SISUAL"
  elseif l:mode=~?"S"
    return "S-LINE"
  elseif l:mode=~?"CTRL-S"
    return "S-BLOCK"

  elseif l:mode=~?"R"
    return "REPLACE"
  elseif l:mode=~?"t"
    return "TERMINAL"
  elseif l:mode=~?"c"
    return "COMMAND"
  elseif l:mode=~?"!"
    return "SHELL"
  endif
endfunction

function! StatuslineModeShort()
  let l:mode=mode()
  if l:mode=="n"
    return "N"
  elseif l:mode=="i"
    return "I"

  elseif l:mode=="v"
    return "V"
  elseif l:mode=="V"
    return "VL"
  elseif l:mode=="CTRL-V"
    return "VB"

  elseif l:mode=~?"s"
    return "S"
  elseif l:mode=~?"S"
    return "SL"
  elseif l:mode=~?"CTRL-S"
    return "SB"

  elseif l:mode=~?"R"
    return "R"
  elseif l:mode=~?"t"
    return "T"
  elseif l:mode=~?"c"
    return "C"
  elseif l:mode=~?"!"
    return "S"
  endif
endfunction
"function! StatuslineMode()
"	return mode()
"endfunction

" from https://stackoverflow.com/a/9578616/12206923
map <space> <leader>

"set mouse=a "see :help mouse
syntax on
set relativenumber
noremap <F2> :set relativenumber!<CR>
noremap <F3> :set wrap!<CR>
noremap <C-1> :q!
"noremap qe :wnext<CR>
noremap qe :bd<CR>
noremap qr :wprevious<CR>
noremap qw :wq<CR>
noremap qq :q<CR>
noremap qQ :q!<CR>
noremap qqq :qa<CR>
noremap qQQ :qa!<CR>
noremap ;; :w<CR>
" from https://youtu.be/qZO9A5F6BZs?t=374
noremap <leader>p "_dP
" from https://vi.stackexchange.com/a/3877
" Quickly insert an empty new line without entering insert mode
noremap <leader>o o<esc>
noremap <leader>O O<esc>

let g:netrw_banner=1
let g:netrw_liststyle=1
set omnifunc=syntaxcomplete#Complete
"nnoremap a i
set laststatus=2
set noshowmode
set statusline=\ %{StatuslineMode()}\ 
set statusline+=%F\ %m%r\ 
set statusline+=%=\ 
set statusline+=%b\ 0x%B\ %y\ %c:%l\/%L\ 	
set statusline+=\(%p\%%\)\ \[%{&fileformat}\,%{&fileencoding?&fileencoding:&encoding},%{StatuslineModeShort()}\]
colorscheme koray
au! BufNewFile,BufRead *.zsh-theme setf zsh
"hi clear StatusLine
"hi StatusLine ctermfg=255 ctermbg=88
"or whatever color

"set statusline+=\ %F%m%r%h%w
"set statusline+=%=
"set statusline+=%#CursorColumn#
"let g:lightline = {
"      \ 'colorscheme': 'molokai',
"      \ }
"hi ctermfg=007 ctermbg=239 
let g:ycm_global_ycm_extra_conf = '~/.vim/pack/my_plugins/opt/YouCompleteMe/.ycm_extra_conf.py'

" Minimap
let g:minimap_width = 20
let g:minimap_auto_start = 1
if &diff
	let g:minimap_auto_start = 0
endif
"let g:minimap_auto_start_win_enter = 1
let g:minimap_highlight_range = 1

" from https://vim.fandom.com/wiki/Copy_filename_to_clipboard
" Convert slashes to backslashes for Windows.
if has('win32')
  nmap ,cs :let @+=substitute(expand("%"), "/", "\\", "g")<CR>
  nmap ,cl :let @+=substitute(expand("%:p"), "/", "\\", "g")<CR>

  " This will copy the path in 8.3 short format, for DOS and Windows 9x
  nmap ,c8 :let @+=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
  nmap ,cs :let @+=expand("%")<CR>
  nmap ,cl :let @+=expand("%:p")<CR>
endif
