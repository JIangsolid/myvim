" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'skywind3000/asyncrun.vim' "编译运行
Plug 'Valloric/YouCompleteMe'  "自动补全
Plug 'Shougo/echodoc.vim' "参数提示

call plug#end()

"  :source ~/.vimrc  重新加载
"  :PlugStatus  检查状态
"  :PlugInstall  安装插件
"  :PlugUpdate  更新插件
"  :PlugClean  卸载插件
"  :PlugUpgrade  升级vim-plug本身


"---------------配色方案----------------
"colorscheme default
"colorscheme darkblue
"colorscheme torte
"colorscheme koehler
"colorscheme desert
set t_Co=256  "可以使用的颜色数目

"---------------基本编辑器设置------------
set noshowmode "参数提示设置
set nu  "显示行号
set ruler  "显示标尺
set laststatus=2  "显示状态行
syntax on  "语法高亮显示
set autoindent  "设置自动缩进
set smartindent  "设置智能缩进
set tabstop=4  "设置（软）制表符宽度为4
set softtabstop=4
set shiftwidth=4  "设置缩进的空格数为4
set backspace=2  "设置退格键正常显示
set nobackup  "设置不要备份
set autoread  "文件在vim外修改过，自动重载
set showmatch "设置高亮括号匹配

"----------括号自动匹配--------------
"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O


"----------多屏切换------------------
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l


"---------------插件设置------------------

"----------NERDTree-----------------
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeWinSize = 25
"let g:NERDTreeWinPos = "right"
nnoremap <silent> <Leader>t :NERDTreeToggle<CR>
nnoremap <silent> <Leader>o :NERDTreeFind<CR>
nmap <F2> :NERDTreeToggle<CR>
"自动打开目录
autocmd VimEnter * NERDTree

"----------Airline----------------
let g:airline_themes='cool'

"设置安装字体的显示
let g:airline_powerline_fonts=1

"打开tabline功能，方便查看Buffer和切换
let g:airline#extension#tabline#enabled=1
let g:airline#extension#tabline#buffer_nr_show=1

"设置切换buffer的快捷键
nnoremap <C-tab> :bn<CR>
nnoremap <C-s-tab> :bp<CR>

"关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#whitespace#symbol='!'

"设置consolas字体

set guifont=Consolas\for\Powerline\FixedD:h11
if !exists('g:airline_symbols')
	let g:airline_symbols={}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

"----------asyncrun.vim-------------
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
autocmd VimEnter * call asyncrun#quickfix_toggle(6)

"定义 F9 为编译单文件
nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

"按 F5 运行
nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

"重新定义项目标志
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 

"定义按 F7 编译整个项目
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>

"配置用 F8 运行当前项目
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>

"按 F6 执行测试
nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>

"定义 F4 为更新 Makefile 文件
nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>

"--------------Youcompleteme------------------------
" 自动补全配置
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致 
"set completeopt=menu,menuone

autocmd InsertLeave * if pumvisible() == 0|pclose|endif	   "离开插入模式后自动关闭预览窗口 

let g:ycm_collect_identifiers_from_tags_files=1	   " 开启 YCM 基于标签引擎 
let g:ycm_cache_omnifunc=0	      " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全 

let g:ycm_complete_in_comments = 1   " 补全功能在注释中同样有效
let g:ycm_complete_in_strings = 1    "在字符串输入中也能补全补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0   "注释和字符串中的文字也会被收入补全

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0       "关闭语法提示 
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2

let g:ycm_confirm_extra_conf=0          " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_global_ycm_extra_conf ='~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
 
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }
