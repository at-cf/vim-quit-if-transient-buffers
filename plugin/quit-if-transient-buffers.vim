if exists("g:loaded_vim_quit_if_transient_buffers")
  finish
endif
let g:loaded_vim_quit_if_transient_buffers = 1

let s:cpo_save = &cpo
set cpo&vim

if !exists("g:transient_buffer_types")
  let g:transient_buffer_types = ['help', 'quickfix']
endif
if !exists("g:transient_buffer_names")
  let g:transient_buffer_names = []
endif

function! s:check_remaining_buffers()
  if tabpagenr('$') == 1
    let i = 1
    while i <= winnr('$')
      let btype = getbufvar(winbufnr(i), '&buftype')
      let bname = bufname(winbufnr(i))
      if (index(g:transient_buffer_types, btype) > -1) ||
        \ (index(g:transient_buffer_names, bname) > -1) ||
        \ (exists('t:NERDTreeBufName') && bname == t:NERDTreeBufName)
        let i += 1
      else
        break
      endif
    endwhile
    if i == winnr('$') + 1
      qall
    endif
    unlet i
    unlet btype
    unlet bname
  endif
endfunction

augroup vim-quit-if-transient-buffers
  autocmd!
  autocmd BufEnter * call <SID>check_remaining_buffers()
augroup END

let &cpo = s:cpo_save
unlet s:cpo_save
