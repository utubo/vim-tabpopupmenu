" -----------------
" popupmenu control
" -----------------

function! s:Setup()
  let s:keys = ' '
  for l:m in s:items
    let s:keys = s:keys . matchstr(l:m, '^.')
  endfor
endfunction

function! tabpopupmenu#popup(key = ' ') abort
  let l:winid = popup_menu(s:items, #{
    \ filter: 'tabpopupmenu#filter',
    \ callback: 'tabpopupmenu#callback',
    \ title: 'Tab Menu',
    \ })
  call win_execute(l:winid, 'call setpos(".", [0,' . stridx(s:keys, a:key). ',0,0])')
endfunction

function! tabpopupmenu#filter(id, key) abort
  let l:index = stridx(s:keys, a:key)
  if l:index > 0
    call popup_close(a:id, l:index)
    return 1
  else
    return popup_filter_menu(a:id, a:key)
  endif
endfunction

" -----------------
" utils
" -----------------

function! s:GetTabnr(tabnr) abort
  return gettabinfo(a:tabnr)[0].tabnr
endfunction

" -----------------
" menu items
" -----------------

let s:items = [
  \ 'n: New tab',
  \ 'o: Open tab',
  \ 'c: Close tab',
  \ 'O: Close others',
  \ '<: Close left tabs',
  \ '>: Close right tabs',
  \ 'H: Move to left',
  \ 'L: Move to right',
  \ '^: Show first',
  \ 'h: Show left',
  \ 'l: Show right',
  \ '$: Show last',
\]

function! tabpopupmenu#callback(id, index) abort
  let l:key = s:keys[a:index]
  if l:key ==# 'n'
    tabnew
  elseif l:key ==# 'o'
    call feedkeys(":\<C-u>tabnew ", 'n')
  elseif l:key ==# 'c'
    tabclose
  elseif l:key ==# 'O'
    tabonly
  elseif l:key ==# '<'
    if s:GetTabnr('.') !=# 1
      0,-tabdo confirm quit
    endif
  elseif l:key ==# '>'
    if s:GetTabnr('.') !=# len(gettabinfo())
      +,$tabdo confirm quit
    endif
  elseif l:key ==# 'H'
    silent! exe '-tabmove'
    call tabpopupmenu#popup(l:key)
  elseif l:key ==# 'L'
    silent! exe '+tabmove'
    call tabpopupmenu#popup(l:key)
  elseif l:key ==# 'h'
    tabprevious
    call tabpopupmenu#popup(l:key)
  elseif l:key ==# 'l'
    tabnext
    call tabpopupmenu#popup(l:key)
  elseif l:key ==# '^'
    tabfirst
    call tabpopupmenu#popup(l:key)
  elseif l:key ==# '$'
    tablast
    call tabpopupmenu#popup(l:key)
  endif
endfunction

call s:Setup()

