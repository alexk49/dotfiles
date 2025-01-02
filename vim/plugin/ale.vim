" ale config

" disable ale by default
let g:ale_enabled = 0

" toggle ALE shortcut
nnoremap <leader>l :ALEToggle<Return>

" use global installations of linters
let b:ale_python_flake8_use_global = 1
let b:ale_python_mypy_use_global = 1
let b:ale_python_black_use_global = 1
let b:ale_python_autoflake_use_global = 1

" stop ALE messages showing as comments
let g:ale_virtualtext_cursor = 0

" set virtual environment names
let g:ale_virtualenv_dir_names = ['venv', '.venv', 'env']

" set line length for flake8
let g:ale_python_flake8_options = '--max-line-length=120'

" ignore es501
let g:ale_python_flake_options = 'ignore = E501'

" set max line length for black
let g:ale_python_black_options='--line-length=120'

" only use specified linters
let g:ale_linters_explicit = 1

let g:ale_linters = {
            \ 'python': ['flake8', 'mypy'],
            \ 'javascript': ['standard'],
            \ 'html': ['tidy'],
            \ 'css': ['stylelint'],
            \ 'xml': ['xmllint'],
            \ 'bash': ['shellcheck'],
            \ 'sh': ['shellcheck'],
            \ 'markdown': ['proselint'],
            \ 'text': ['proselint'],
            \ }

" set ALE fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'standard'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\   'python': ['black', 'autoflake'],
\   'xml': ['xmllint'],
\}

" fix files when you save them.
let g:ale_fix_on_save = 1
