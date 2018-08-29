    set nocompatible              " 去除VI一致性,必须
    filetype off                  " 必须

    " 设置包括vundle和初始化相关的runtime path
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " 另一种选择, 指定一个vundle安装插件的路径

    Plugin 'VundleVim/Vundle.vim'
	Plugin 'scrooloose/nerdtree'
	Plugin 'Lokaltog/vim-powerline.git'
	Plugin 'Valloric/YouCompleteMe' " 代码补全
	Plugin 'skywind3000/asyncrun.vim' "编译运行
	Plugin 'w0rp/ale' "动态检查
	Plugin 'Yggdroot/LeaderF' "函数列表、文件切换
	Plugin 'Shougo/echodoc.vim' "参数提示功能
	Plugin 'octol/vim-cpp-enhanced-highlight' "编辑辅助功能

    call vundle#end()            " 必须
    filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
    " 忽视插件改变缩进,可以使用以下替代:
    "filetype plugin on
    "
    " 简要帮助文档
    " :PluginList       - 列出所有已配置的插件
    " :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
    " :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
    " :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
    "
    " 查阅 :h vundle 获取更多细节和wiki以及FAQ
    " 将你自己对非插件片段放在这行之后
	"
	"
"外观
"colorscheme default 
"colorscheme darkblue 
colorscheme torte 
"colorscheme koehler
"colorscheme desert
set nocp
"显示行号
set nu
"显示标尺
set ruler
"语法高亮显示：
syntax on
"设置自动缩进
set autoindent
"设置智能缩进
set smartindent
"设置（软）制表符宽度为4：
set tabstop=4
set softtabstop=4
"设置缩进的空格数为4
set shiftwidth=4
"设置使用 C/C++ 语言的自动缩进方式：
set cindent
"设置C/C++语言的具体缩进方式:
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
"设置退格键正常显示
set backspace=2
"设置不备份
set nobackup
""文件在vim外修改过，自动重载
set autoread
"设置高亮括号匹配
set showmatch
set tags+=~/.vim/systags
set tags=tags;
"高亮c代码的方法名
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi cFunctions gui=NONE cterm=bold  ctermfg=blue
"在选择模式下系统级复制
vnoremap ,y "+y<ESC>
""在选择模式下系统级剪切
vmap ,x x:let @+=@"<CR>
"系统级复制
noremap ,p "+p
"nmap ,V "+P
""全选
nmap ,a ggvG$
""切换到16进制编辑方式
map ,b :%!xxd<CR>
"切换回正常编辑方式
map ,B :%!xxd -r<CR>
""cscope 快捷键
set cscopequickfix=s-,c-,d-,i-,t-,e-
cs add cscope.out ./
"nmap <C-a>  :cs add cscope.out ./<cr>
"nmap <C-.>  :cs find s <C-R>=expand("<cword>")<cr><cr>
"nmap <C-.>  :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap <C-c>  :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap <C-x>  :cs find t <C-R>=expand("<cword>")<cr><cr>
"nmap <C-.>  :cs find e <C-R>=expand("<cword>")<cr><cr>
"nmap <C-.>  :cs find f <C-R>=expand("<cfile>")<cr><cr>
"nmap <C-.>  :cs find i <C-R>=expand("<cfile>")<cr><cr>
"nmap <C-.>  :cs find d <C-R>=expand("<cword>")<cr><cr>



"-----NERDTree-----
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeWinSize = 25
let g:NERDTreeWinPos = "right"
nnoremap <silent> <Leader>t :NERDTreeToggle<CR>
nnoremap <silent> <Leader>o :NERDTreeFind<CR>

"-----Powerline-----
set fillchars+=stl:\ ,stlnc:\
let g:Powerline_symbols = 'compatible'
let g:Powerline_stl_path_style = 'filename'  "只显示文件名

"-----YouCompleteMe-----
"let g:ycm_server_python_interpreter= '/bin/python'
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py' "默认配置文件
"let g:ycm_key_invoke_completion = '<C-Tab>'        "跨文件补全
"let g:ycm_confirm_extra_conf = 0                    "关闭加载配置文件提示
"let g:ycm_cache_omnifunc = 0                        "关闭补全缓存
"let g:ycm_enable_diagnostic_signs = 0              "关闭诊断提示符
"let g:ycm_enable_diagnostic_highlighting = 1        "关闭诊断高亮
"let g:ycm_show_diagnostics_ui = 0                  "关闭诊断ui
"let g:ycm_min_num_of_chars_for_completion = 3      "n字符开始自动补全
"获取变量类型
nnoremap <silent><Leader>yt :YcmCompleter GetType<CR>
"跳转定义或声明
nnoremap <silent><Leader>yg :YcmCompleter GoTo<CR>
"跳转包含文件
nnoremap <silent><Leader>yi :YcmCompleter GoToInclude<CR>
"打开诊断信息
nnoremap <silent><Leader>yd :YcmDiags<CR>

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone
 
noremap <c-z> <NOP>
 
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }




"--------编译运行-------

"--------asyncrun----------
 
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
 
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
 
" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

"定义F9为编译单文件
nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

"定义F5运行文件
nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"重新定义项目标志
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']
"定义按 F7 编译整个项目：
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
"继续配置用 F8 运行当前项目
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>
"定义怎么 run ，接着按 F6 执行测试
nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>
"定义 F4 为更新 Makefile 文件，如果不用 cmake 可以忽略
nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>


"--------动态检查--------

"-------ALE-------------

let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

"----------ALE自定义----
let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

"--------文本切换------
"--------LeaderF-------

let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
"这里定义了 CTRL+P 在当前项目目录打开文件搜索，CTRL+N 打开 MRU搜索，搜索你最近打开的文件，这两项是我用的最频繁的功能。接着 ALT+P 打开函数搜索，ALT+N 打开 Buffer 搜索
