set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait9999999999999

let s:default_fontsize = 11
let s:fontsize = s:default_fontsize
let s:font = "Source Code Pro"

function! SetFont() abort
  if exists('g:GtkGuiLoaded')
    let s:font = "Source Code Pro Regular"
    call rpcnotify(1, 'Gui', 'Font', s:font . ' ' . s:fontsize)
    let g:GuiInternalClipboard = 1
    let NVIM_GTK_NO_HEADERBAR=1
  elseif exists("g:gui_oni")
    call rpcnotify(1, 'Gui', 'Font', s:font . ' ' . s:fontsize)
  else
    exec "GuiFont " . s:font . ":h" . s:fontsize
  endif
endfunction

call SetFont()

function! AdjustFontSize(delta)
  let s:fontsize += a:delta
  call SetFont()
endfunction

function! ResetFontSize()
  let s:fontsize = s:default_fontsize
  call SetFont()
endfunction

nnoremap <C-=> :call AdjustFontSize(1)<CR>
nnoremap <C-+> :call AdjustFontSize(1)<CR>
nnoremap <C--> :call AdjustFontSize(-1)<CR>
nnoremap <C-0> :call ResetFontSize()<CR>
