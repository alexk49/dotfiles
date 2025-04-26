" ale config

" disable ale by default
let g:ale_enabled = 0

" toggle ALE shortcut
nnoremap <leader>l :ALEToggle<Return>

" Run ALE Fixers
nnoremap <leader>f :ALEFix<Return>

" use global installations of linters
"let b:ale_python_flake8_use_global = 1
let b:ale_python_mypy_use_global = 1
"let b:ale_python_black_use_global = 1
"let b:ale_python_autoflake_use_global = 1
let b:ale_python_ruff_use_global = 1
let b:ale_python_ruff_format_use_global = 1

" stop ALE messages showing as comments
let g:ale_virtualtext_cursor = 0

" set virtual environment names
let g:ale_virtualenv_dir_names = ['venv', '.venv', 'env']

"let g:ale_python_flake8_options = '--config=~/.config/flake8'

"let g:ale_python_black_options = '--config=~/.black'

let g:ale_python_mypy_options = '--ignore-missing-imports'

" only use specified linters
let g:ale_linters_explicit = 1

let g:ale_linters = {
            \ 'python': ['ruff', 'mypy'],
            \ 'javascript': ['standard', 'eslint'],
            \ 'html': ['tidy'],
            \ 'css': ['stylelint'],
            \ 'xml': ['xmllint'],
            \ 'bash': ['shellcheck'],
            \ 'sh': ['shellcheck'],
            \ 'markdown': ['proselint'],
            \ 'text': ['proselint'],
            \ }

let g:ale_python_ruff_format_options = '--unfixable=F401 --line-length=120'


" set ALE fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'standard'],
\   'python':  ['ruff', 'ruff_format'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\}

" fix files when you save them.
" let g:ale_fix_on_save = 1
