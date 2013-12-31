if !executable('ghc-hare')
  finish
endif

command! -buffer -bang -nargs=1 HaReRename call hare#Rename(expand('%'), <q-args>, line('.'), col('.'), !empty(<q-bang>))
