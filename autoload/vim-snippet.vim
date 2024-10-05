" autoload/snippet.vim
function! snippet#InsertSnippet(file)
    " Get the path to the snippet file
    let l:base_path = expand("<sfile>:p:h") . '/snippets/'
    let l:file_path = l:base_path . a:file
    " Check if the file exists
    if filereadable(l:file_path)
        " Read the content of the file
        let l:content = readfile(l:file_path)
        " Join the lines into a single string
        let l:content_str = join(l:content, "\n")
        " Insert the content at the cursor position
        execute "normal! i" . l:content_str
    else
        echohl ErrorMsg
        echomsg "File not found: " . l:file_path
        echohl None
    endif
endfunction
