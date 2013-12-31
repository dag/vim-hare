function! s:ghc_options()
  let l:opts = copy(get(b:, 'hare_ghc_options', get(g:, 'hare_ghc_options', [])))
  return join(map(l:opts, '"-g ".shellescape(v:val)'))
endfunction

function! s:hare(...)
  call system('ghc-hare '.join(map(copy(a:000), 'shellescape(v:val)')))
endfunction

function! hare#Rename(filename, newname, line, col, replace)
  let l:refactored = a:filename.'.refactored'
  call s:hare('rename', a:filename, a:newname, a:line, a:col)
  if a:replace
    call rename(l:refactored, a:filename)
    edit
  else
    execute 'vertical diffsplit' l:refactored
  endif
endfunction
