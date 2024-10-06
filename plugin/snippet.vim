function! InsertHTML5Snippet()
  call append(line('.'), [
        \ '<!DOCTYPE html>',
        \ '<html lang="en">',
        \ '<head>',
        \ '    <meta charset="UTF-8">',
        \ '    <meta http-equiv="X-UA-Compatible" content="IE=edge">',
        \ '    <meta name="viewport" content="width=device-width, initial-scale=1.0">',
        \ '    <title>Document</title>',
        \ '</head>',
        \ '<body>',
        \ '',
        \ '</body>',
        \ '</html>'
        \ ])
  " Move the cursor to the title tag for editing
  normal! 5j
  normal! 7|
endfunction
