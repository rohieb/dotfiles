noremap <leader>l* :call ledger#transaction_state_toggle(line('.'), ' *')<CR>
inoremap <silent> <C-J> <C-r>=ledger#autocomplete_and_align()<CR>
vnoremap <silent> <C-J> :LedgerAlign<CR>
noremap <leader>le :call ledger#entry()<CR>

" note: for some reason, the quickfix window wraps lines after 90 chars of
" output (even if the terminal has 126 columns)
let g:ledger_qf_register_format =
    \ '%(date) %-34(truncated(payee, 34, 3)) '.
    \ '%-32(truncated(display_account, 32, 3)) '.
    \ '%12(scrub(display_amount)) %12(scrub(display_total))\n'

nmap <Leader>lb :Ledger bal --market --columns=110<CR>
nmap <Leader>lr :Ledger reg --market --columns=110<CR>

let g:ledger_bin = "ledger"
let g:ledger_date_format = "%d-%m-%y"
let g:ledger_default_commodity = "€"
let g:ledger_commodity_before = 0
let g:ledger_align_at = 60

" easier autocomplete for account names (includes isalpha(), 0..9 and -_:. )
setl iskeyword=@,45-46,48-57,:,_

setl tw=0 cursorcolumn=63
setl ts=2 sw=2 sts=2 noet

" allow completing "Che" as "Assets:Bank:Checking" with C-X C-O
let g:ledger_fuzzy_account_completion = 1
" also for using Ctrl-N/Ctrl-P
setl completeopt+=fuzzy
