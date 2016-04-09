" Plug 'fatih/vim-go'
let g:go_fmt_command = "goimports"

" Plug 'scrooloose/syntastic'

let g:syntastic_enable_highlighting = 1

function LoadSyntasticJavaScriptStandard()
  let b:syntastic_checkers = ['standard']
  let g:syntastic_javascript_standard_args = "--global $ --global it --global describe"
endfunction

" Check for jshint config first ...
if filereadable('.jshintrc')
  let b:syntastic_checkers = ['jshint']
" ... then for eslint.
elseif filereadable('.eslintrc')
  let b:syntastic_checkers = ['eslint']
elseif filereadable('.eslintrc.json')
  let b:syntastic_checkers = ['eslint']
" Assume feross/standard should be installed locally.
elseif filereadable('node_modules/standard/package.json')
  call LoadSyntasticJavaScriptStandard()
elseif filereadable('../node_modules/standard/package.json')
  call LoadSyntasticJavaScriptStandard()
elseif filereadable('../../node_modules/standard/package.json')
  call LoadSyntasticJavaScriptStandard()
" Fallback to eslint, using ~/.eslintrc.json which extends eslint:recommended
else
  let b:syntastic_checkers = ['eslint']
endif
