" Better :grep
set grepprg=rg\ --vimgrep\ --follow\ --max-columns=1000\ --case-sensitive
set grepformat=%f:%l:%c:%m,%f:%l:%m
function! Grep(...)
  return system(join([&grepprg] + a:000), ' ')
endfunction
command! -nargs=+ -complete=file_in_path -bar Grep      cgetexpr Grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar GrepWord  cgetexpr Grep(<f-args> . ' -w')
augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost cgetexpr cwindow
augroup END
nmap <c-f> :Grep<space><space>.<left><left>
nmap <leader>f :GrepWord<space><c-r><c-w><space>.<cr>
vmap <leader>f "9y:Grep<space>'<c-r>9'<space>.<cr>

