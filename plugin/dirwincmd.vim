" <c-w>s / Splitting {{{1
nnoremap          <c-w>s      <nop>
nmap              <c-w>v      <c-w>s
nnoremap <silent> <c-w>sh     :<c-u>exe 'aboveleft '  .. (v:count ? v:count*10 : '') .. 'vsplit'<cr>
nnoremap <silent> <c-w>sj     :<c-u>exe 'belowright ' .. (v:count ? v:count*10 : '') .. 'split'<cr>
nnoremap <silent> <c-w>sk     :<c-u>exe 'aboveleft '  .. (v:count ? v:count*10 : '') .. 'split'<cr>
nnoremap <silent> <c-w>sl     :<c-u>exe 'belowright ' .. (v:count ? v:count*10 : '') .. 'vsplit'<cr>
nnoremap <silent> <c-w>sH     :<c-u>exe 'topleft '    .. (v:count ? v:count*10 : '') .. 'vsplit'<cr>
nnoremap <silent> <c-w>sJ     :<c-u>exe 'botright '   .. (v:count ? v:count*10 : '') .. 'split'<cr>
nnoremap <silent> <c-w>sK     :<c-u>exe 'topleft '    .. (v:count ? v:count*10 : '') .. 'split'<cr>
nnoremap <silent> <c-w>sL     :<c-u>exe 'botright '   .. (v:count ? v:count*10 : '') .. 'vsplit'<cr>

" <c-w>t / Tabs / Term {{{1
" TODO: wrapper for tabmove.
nnoremap          <c-w>t  <nop>
nnoremap <silent> <c-w>te :<c-u>tabe %<cr>
nnoremap <silent> <c-w>tn :<c-u>exe (v:count ? v:count-1 : '$')..'tabnew'<cr>
nnoremap <silent> <c-w>tm :<c-u>exe v:count..'tabmove'<cr>
nnoremap <silent> <c-w>to :<c-u>tabonly<cr>
if has('nvim')
  nnoremap <silent> <c-w>tt :<c-u>tabe +term<cr>
else
  nnoremap <silent> <c-w>tt :<c-u>tab term<cr>
endif

" Term
let s:term = has('nvim') ? "split +term" : "term"
call execute([
\"nnoremap <silent> <c-w>th :<c-u>aboveleft  vertical " . s:term . "<cr>",
\"nnoremap <silent> <c-w>tj :<c-u>belowright          " . s:term . "<cr>",
\"nnoremap <silent> <c-w>tk :<c-u>aboveleft           " . s:term . "<cr>",
\"nnoremap <silent> <c-w>tl :<c-u>belowright vertical " . s:term . "<cr>",
\"nnoremap <silent> <c-w>tH :<c-u>topleft    vertical " . s:term . "<cr>",
\"nnoremap <silent> <c-w>tJ :<c-u>botright            " . s:term . "<cr>",
\"nnoremap <silent> <c-w>tK :<c-u>topleft             " . s:term . "<cr>",
\"nnoremap <silent> <c-w>tL :<c-u>botright   vertical " . s:term . "<cr>",
\]) | unlet s:term

" <c-w>n / new {{{1
nnoremap          <c-w>n  <nop>
nnoremap <silent> <c-w>nh :<c-u>exe 'aboveleft '  .. (v:count ? v:count*10 : '') .. 'vnew'<cr>
nnoremap <silent> <c-w>nj :<c-u>exe 'belowright ' .. (v:count ? v:count*10 : '') .. 'new'<cr>
nnoremap <silent> <c-w>nk :<c-u>exe 'aboveleft '  .. (v:count ? v:count*10 : '') .. 'new'<cr>
nnoremap <silent> <c-w>nl :<c-u>exe 'belowright ' .. (v:count ? v:count*10 : '') .. 'vnew'<cr>
nnoremap <silent> <c-w>nH :<c-u>exe 'topleft '    .. (v:count ? v:count*10 : '') .. 'vnew'<cr>
nnoremap <silent> <c-w>nJ :<c-u>exe 'botright '   .. (v:count ? v:count*10 : '') .. 'new'<cr>
nnoremap <silent> <c-w>nK :<c-u>exe 'topleft '    .. (v:count ? v:count*10 : '') .. 'new'<cr>
nnoremap <silent> <c-w>nL :<c-u>exe 'botright '   .. (v:count ? v:count*10 : '') .. 'vnew'<cr>

" <c-w>e / cmdline template {{{1
nnoremap <c-w>et :<c-u><c-r>=v:count ? v:count : '$'<cr>tab<space>
nnoremap <c-w>eh :<c-u>aboveleft vertical<space>
nnoremap <c-w>ej :<c-u>belowright<space>
nnoremap <c-w>ek :<c-u>aboveleft<space>
nnoremap <c-w>el :<c-u>belowright vertical<space>
nnoremap <c-w>eH :<c-u>topleft vertical<space>
nnoremap <c-w>eJ :<c-u>botright<space>
nnoremap <c-w>eK :<c-u>topleft<space>
nnoremap <c-w>eL :<c-u>botright vertical<space>

" <c-w>r / Resizing {{{1
nnoremap <c-w>r     <nop>
nnoremap <c-w>rq    <nop>
nmap     <c-w><c-r> <c-w>r
nmap     <c-w>rh    <c-w><<c-w>r
nmap     <c-w>rj    <c-w>-<c-w>r
nmap     <c-w>rk    <c-w>+<c-w>r
nmap     <c-w>rl    <c-w>><c-w>r
nmap     <c-w>rH    <esc>5<c-w><<c-w>r
nmap     <c-w>rJ    <esc>5<c-w>-<c-w>r
nmap     <c-w>rK    <esc>5<c-w>+<c-w>r
nmap     <c-w>rL    <esc>5<c-w>><c-w>r
nnoremap <c-w>rm    <c-w>_<c-w><bar>

" Misc {{{1
" scroll alternate window
nmap     <silent> <c-w><c-e>  :<c-u>silent! call win_execute(win_getid(winnr('#')), "normal \<lt>c-e>")<cr><c-w>
nmap     <silent> <c-w><c-y>  :<c-u>silent! call win_execute(win_getid(winnr('#')), "normal \<lt>c-y>")<cr><c-w>

" Conditional {{{1
augroup wincmd
  au!
  au vimenter * ++once call s:post_viminit()
augroup END

function! s:post_viminit() abort
  if get(g:, 'wincmd_use_hints', 0) == 0
    return
  endif
  nnoremap          <c-w>c      :<c-u>call dirwincmd#close_window({})<cr>
  nnoremap <silent> <c-w><c-w>  :<c-u>exe v:count ? (v:count.."wincmd w") : "call dirwincmd#select_window({})"<cr>
  nnoremap <silent> <c-w>x      :<c-u>call dirwincmd#swap_window({})<cr>
endfunction
