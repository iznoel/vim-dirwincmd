DIRectional-WinCMD
==================

A revamp for most mappings prefixed with `<c-w>`.

This plugin presents a layout integrating directional modifiers
with common 'wincmd' operations as three-keypress mappings.

```
[<c-w>]    [sntcxr]    [hjklHJKLt]
prefix     operation   direction
```

## Overview

Directional:

- `<c-w>s [hjklHJKL]` split window *in direction [x]*
- `<c-w>n [hjklHJKL]` new window/buffer *in direction [x]*
- `<c-w>t [hjklHJKL]` new terminal *in direction [x]*
- `<c-w>c [hjklHJKL]` close a split *in direction [x]*
- `<c-w>e [hjklHJKLt]` start command with relevant modifiers *for direction [x]*

Tabs:

- `<c-w>tt` new terminal buffer in a tab
- `<c-w>tn` new buffer in a tab
- `<c-w>te` current buffer in a new tab
- `<c-w>tm` move tab *(prefixed by count)*
- `<c-w>to` tab only *(close all other tabs)*

Misc:

- `<c-w>r [hjklHJKL]` recursive resize bind
- `<c-w>r m` resize to max width and height
- `<c-w><c-[ye]>` scroll 'previous' split up/down

Statusline Hints:

- `<c-w><c-w>` start hinting and focus
- `<c-w>x` start hinting and swap
- `<c-w>c` start hinting and close

## config

```vim
let g:wincmd_use_hints = 1
" enable hint mappings
```

## Todo

- tab access binds
- write help
