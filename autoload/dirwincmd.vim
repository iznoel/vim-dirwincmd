let s:id = expand("<SID>")

function! dirwincmd#close_window(opts) abort " {{{1
  let nr = has_key(a:opts, 'nr') ? a:opts.nr : dirwincmd#hint_winnr()
  if nr > 0 && nr != winnr() | exe nr . 'wincmd c' | endif
endfunction

function! dirwincmd#select_window(opts) abort " {{{1
  let nr = has_key(a:opts, 'nr') ? a:opts.nr : dirwincmd#hint_winnr()
  if nr > 0 && nr != winnr() | exe nr . 'wincmd w' | endif
endfunction

function! dirwincmd#swap_window(opts) abort " {{{1
  let nr = has_key(a:opts, 'nr') ? a:opts.nr : dirwincmd#hint_winnr()
  let src = winnr()
  if nr > 0 && nr != src
    let [aid,bid] = [win_getid(src), win_getid(nr)]
    let views = []
    function! s:save_view() abort closure
      call add(views, winsaveview())
    endfunction
    call map([aid,bid], 'win_execute(v:val, "call "..s:id.."save_view()")')
    let [abuf, bbuf] = map([aid,bid], 'getwininfo(v:val)[0].bufnr')
    call win_execute(aid, ['buffer ' . bbuf, 'call winrestview('..string(views[1])..')' ])
    call win_execute(bid, ['buffer ' . abuf, 'call winrestview('..string(views[0])..')' ])
  endif
endfunction

function! dirwincmd#hint_winnr() abort " {{{1
  if has_key(t:, 'wins') | return | endif
  let keypress = -1
  try
    let s:nearby_windows = #{c: winnr(), p: winnr('#'), h: winnr('h'), j: winnr('j'), k: winnr('k'), l: winnr('l')}
    let [s:real_statusline, &statusline] = [&statusline, '%!'..s:id..'temp_statusline()']
    redrawstatus
    echo 'Pick a window...'
    let keypress = s:getchar(2)
    let nr = keypress ==? 'w'      ? (winnr('$') + winnr()+(1-(keypress ==# 'W')*2) -1) % winnr('$')+1
      \    : keypress ==? 'p'      ? winnr('#')
      \    : keypress =~? '[hjkl]' ? winnr(keypress)
      \    : keypress =~? '\d' && win_getid(keypress) ? keypress : -1
  finally
    let &statusline = s:real_statusline
    unlet s:nearby_windows
    redraw
    echo ''

  endtry
  return nr
endfunction

function! s:getchar(timeout) abort " {{{1
  let start = reltime()
  let end = a:timeout * 1.0
  let diff = reltimefloat(reltime(start, reltime()))
  while diff < end && diff > 0
    if getchar(1)
      return nr2char(getchar())
    endif
    sleep 100m
    let diff = reltimefloat(reltime(start, reltime()))
  endwhile
  return -1
endfunction

function! s:temp_statusline() abort " {{{1
  let winnr = win_id2win(g:statusline_winid)

  let tw = map(copy(s:nearby_windows), 'v:val == winnr')
  let hilite = tw.c ? "statusline"
    \ : tw.h || tw.j || tw.k || tw.l ? "DiffDelete"
    \ : tw.p ? "DiffAdd" : "StatusLineNc"

  let hint = keys(filter(copy(tw),'v:val && v:key != "c"'))->join(',')
  let hint = len(hint) ? '['..hint..']: ' : ''

  return printf("%%#%s#%*s(%d)", hilite, (winwidth(winnr)+len(hint)-3)/2, hint, winnr)
endfunction

