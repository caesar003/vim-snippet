" Define the snippets table
let g:snippets = {
\   'javascript': {
\       'trycatch': [
\           'try {',
\           '    // Your code here',
\           '} catch (error) {',
\           '    console.error(error);',
\           '}'
\       ],
\       'forloop': [
\           'for (let i = 0; i < array.length; i++) {',
\           '    // Loop logic here',
\           '}'
\       ]
\   },
\   'php': {
\       'function': [
\           '<?php',
\           'function functionName() {',
\           '    // Function logic here',
\           '}',
\           '?>'
\       ]
\   },
\   'html': {
\       'html5': [
\           '<!DOCTYPE html>',
\           '<html lang="en">',
\           '<head>',
\           '    <meta charset="UTF-8">',
\           '    <meta http-equiv="X-UA-Compatible" content="IE=edge">',
\           '    <meta name="viewport" content="width=device-width, initial-scale=1.0">',
\           '    <title>Document</title>',
\           '</head>',
\           '<body>',
\           '',
\           '</body>',
\           '</html>'
\       ]
\   }
\ }

" Function to insert snippets dynamically based on filetype and snippet name
function! InsertSnippet(snippetName)
    let l:ft = &filetype

    " Check if the language exists in the snippet table
    if has_key(g:snippets, l:ft)
        " Check if the requested snippet exists for this language
        if has_key(g:snippets[l:ft], a:snippetName)
            " Insert the snippet
            call append(line('.'), g:snippets[l:ft][a:snippetName])
            echo 'Inserted ' . a:snippetName . ' snippet for ' . l:ft
        else
            echo 'Snippet not found for ' . a:snippetName
        endif
    else
        echo 'No snippets available for filetype ' . l:ft
    endif
endfunction

" Function to map snippet keys dynamically
function! MapSnippetKeys()
    let l:ft = &filetype

    if has_key(g:snippets, l:ft)
        " Clear existing mappings for snippets
        unmap <leader>tc
        unmap <leader>fl

        " Add mappings for each snippet in the current language
        if has_key(g:snippets[l:ft], 'trycatch')
            nnoremap <leader>tc :call InsertSnippet('trycatch')<CR>
        endif
        if has_key(g:snippets[l:ft], 'forloop')
            nnoremap <leader>fl :call InsertSnippet('forloop')<CR>
        endif
        " Add more snippet mappings dynamically as needed
    endif
endfunction

" Automatically map keys when entering a buffer
autocmd BufEnter * call MapSnippetKeys()
