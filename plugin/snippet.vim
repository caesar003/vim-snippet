" plugin/snippet.vim
command! -nargs=1 Snippet call snippet#InsertSnippet(<f-args>)

" Optionally, create a mapping for easier usage
" nnoremap <leader>s :Snippet <C-R><C-W><CR>
