" disable ale by default
let g:ale_enabled = 0

" toggle ALE shortcut
nnoremap <leader>l :ALEToggle<Return>

" Run ALE Fixers
nnoremap <leader>f :ALEFix<Return>

" lsp completion
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
set completeopt=menuone,noselect

" virtual text / config ALE messages showing as comments
let g:ale_virtualtext_cursor = 1
set signcolumn=yes

" global lsp/linter settings

" python
"let g:ale_python_pylsp_use_global = 1

" javascript / typescript
"let g:ale_javascript_tsserver_use_global = 1
"let g:ale_typescript_tsserver_use_global = 1

" html / css
"let g:ale_html_vscodehtml_use_global = 1
"let g:ale_css_vscodecss_use_global = 1

" bash / shell
"let g:ale_sh_language_server_use_global = 1
"let g:ale_sh_shellcheck_use_global = 1

" set virtual environment names
let g:ale_virtualenv_dir_names = ['venv', '.venv', '.dev-venv', 'env', '.dist-venv']

" --- python linter options ---
let g:ale_python_ruff_format_options = '--unfixable=F401 --line-length=120'
let g:ale_python_mypy_options = '--ignore-missing-imports'

" --- root detection patterns ---
let g:ale_root_patterns = ['.git', 'package.json', 'pyproject.toml', 'setup.py', '.venv', '.env']

" only use specified linters
" let g:ale_linters_explicit = 1

" configure specific linters:
let g:ale_linters = {
      \ 'python': ['ruff', 'mypy', 'pylsp'],
      \ 'javascript': ['tsserver', 'eslint', 'standard'],
      \ 'typescript': ['tsserver', 'eslint', 'standard'],
      \ 'html': ['vscodehtml', 'tidy'],
      \ 'css': ['vscodecss', 'stylelint'],
      \ 'bash': ['bash-language-server', 'shellcheck'],
      \ 'sh': ['bash-language-server', 'shellcheck'],
      \ 'sql': ['sqls'],
      \ 'xml': ['xmllint'],
      \ 'markdown': ['proselint'],
      \ 'text': ['proselint'],
      \ }

" set ALE fixers
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier', 'standard'],
      \ 'python': ['ruff', 'ruff_format'],
      \ }

" keymaps for LSP features
nnoremap K <cmd>ALEHover<CR>
let g:ale_set_balloons = 1


nnoremap gd <cmd>ALEGoToDefinition<CR>
nnoremap grd <cmd>ALEGoToDefinition<CR>
nnoremap <leader>gr <cmd>ALEFindReferences<CR>
nnoremap <leader>ca <cmd>ALECodeAction<CR>

" Ensure NVM Node paths are visible to Vim
if exists('$NVM_DIR')
    let $PATH = expand('$NVM_DIR/versions/node/$(node -v)/bin') . ':' . $PATH
endif
