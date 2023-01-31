"=========================
" Packer插件管理
lua require('plugins')
"======= vim 自身配置
    set hidden " 如果设置成nohidden 那么toggleterm 不会保存退出的终端
    set noswapfile
    set nocompatible
    set mouse=a  "所有模式 set history=100
    set shell=/bin/zsh
    set updatetime=5000
    "自动补全
    set wildmode=longest,list
    "外观
    set t_Co=256
    set number
    set cursorline "光标当前行高亮
    set wrap  "自动折行
    set laststatus =2 "是否显示状态栏
    set ruler "在状态栏显示光标的当前位置
    syntax enable
    set showmode
    set showcmd
    set encoding=utf-8
    "折叠
    set foldmethod=indent
    set foldlevel=99
    "缩进
    set autoindent
    set tabstop=4 "一个tab显示出来是多少空格的宽度
    set softtabstop=4 "当编辑模式时按backspace 删除的空格数量"
    set shiftwidth=4 "每一级缩进的宽度"
    set expandtab  "自动将tab转化为空格
    "搜索
    set showmatch "高亮匹配括号
    set hlsearch
    set ignorecase
    set smartcase
    "编辑
    set backspace=indent,eol,start
    "indent    allow backspacing over autoindent
    "eol       allow backspacing over line breaks (join lines)
    "start     allow backspacing over the start of insert; CTRL-W and CTRL-U stop once at the start of insert.
    "
    set completeopt=menu,menuone,noselect "" 有关cmp 的补全菜单设置
"========Key Map
    let mapleader=','
    nnoremap <silent> <C-h> :tabprevious<cr>
    nnoremap <silent> <C-l> :tabnext<cr>
    " buffer
    nnoremap <silent> <C-j> :bnext<cr>
    nnoremap <silent> <C-k> :bprevious<cr>
    nnoremap <M-j> <C-w>j
    nnoremap <M-k> <C-w>k
    nnoremap <M-h> <C-w>h
    nnoremap <M-l> <C-w>l
    nnoremap <M-J> <C-w><S-j>
    nnoremap <M-K> <C-w><S-k>
    nnoremap <M-H> <C-w><S-h>
    nnoremap <M-L> <C-w><S-l>

    nnoremap <A-left> <C-w><
    nnoremap <A-right> <C-w>>
    nnoremap <A-up> <C-w>+
    nnoremap <A-down> <C-w>-
    nnoremap <Del> :bd!<Cr>
    inoremap <S-CR> <esc>o

    inoremap ￥ $
    inoremap （ (
    inoremap ） )

    " 插件相关
    nnoremap <A-t> :NvimTreeToggle<cr>
    nnoremap <C-t> :lua require('FTerm').toggle()<cr>
    " 图片粘贴
    nnoremap <leader>p :call mdip#MarkdownClipboardImage()<CR>
    " telescope 快速搜索
    nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
    nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
    nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
    nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
    nnoremap <leader>fo <cmd>lua require('telescope.builtin').oldfiles()<cr>
    nnoremap <leader>fm <cmd>lua require('telescope.builtin').marks()<cr>
    " Luasnip choice node change 
    imap <silent><expr> <C-Space> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-Space>' 
    imap <silent><expr> <C-Space> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-Space>' 
    imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
    smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
    " terminal -- toggle-term 
    " set
    autocmd TermEnter term://*toggleterm#*
          \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
    " By applying the mappings this way you can pass a count to your
    " mapping to open a specific window.
    " For example: 2<C-t> will open terminal 2
    nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
    function Build()
        execute "write"
        execute "!mkdir -p %:p:h/build"
        execute "!gcc -g % -o %:p:h/build/%:t:r"
    endfunction
    function Build_Run()
        call Build()
        execute "! %:p:h/build/%:t:r"
    endfunction
    nnoremap <f5> :call Build()<CR>
    nnoremap <f6> :call Build_Run()<CR>
    nnoremap <f7> :call system('nohup gdbgui > /dev/null&')<CR>


"=======================================
" 皮肤设置  先设置皮肤样式再让vim 应用皮肤
    let g:material_style = "oceanic"
    colorscheme material

