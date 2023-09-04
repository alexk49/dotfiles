" ale config

" only use specified linters
let g:ale_linters_explicit = 1
let b:ale_linters = {
            \ 'python': ['flake8', 'mypy'],
            \ 'javascript': ['standard'],
            \ 'html': ['tidy'],
            \ 'css': ['stylelint'],
            \ 'xml': ['xmllint'],
            \ 'bash': ['shellcheck'],
            \ 'sh': ['shellcheck'],
            \ }

let b:ale_python_flake8_use_global = 1
let b:ale_python_mypy_use_global = 1
let b:ale_python_black_use_global = 1
let b:ale_python_autoflake_use_global = 1

" stop ALE messages showing as comments
let g:ale_virtualtext_cursor = 0

" set virtual environment names
let g:ale_virtualenv_dir_names = ['venv', '.venv', 'env']

" set line length for flake8
let g:ale_python_flake8_options = '--max-line-length=88'

" set ALE fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'standard'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\   'python': ['black', 'autoflake'],
\}

" fix files when you save them.
let g:ale_fix_on_save = 1
