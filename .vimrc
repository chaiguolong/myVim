:set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
:set termencoding=utf-8
:set encoding=utf-8
" 定义快捷键的前缀，即<Leader>
let mapleader=";"
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 开启实时搜索功能
set incsearch
"设置命令行的高度
"set cmdheight=1
" 搜索时大小写不敏感
set ignorecase
" 去掉有关vi一致性模式，避免以前版本的一些bug和局限，解决backspace不能使用的问题
"  set nocompatible
 set backspace=indent,eol,start
" set backspace=1
" 共享剪贴板
 set clipboard+=unnamed
" 顶部底部保持3行距离
set scrolloff=8
" vim 自身命令行模式智能补全
set wildmenu
"vim禁用自动备份
set nobackup
set nowritebackup
set noswapfile
"使用终端的背景
" let g:solarized_termtrans=1 
" let g:gruvbox_termtrans=1 

" 显示光标当前位置
set ruler
" 开启行号显示
set number
"高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch

"总是显示状态栏
set laststatus=2

" 开启语法高亮功能
syntax enable

" 允许用指定语法高亮配色方案替换默认方案,vim有点卡就改为off了,测试是不是这个选项导致vim卡顿
syntax on

"设置使用该配色主题,在.vim/color目录下
 colorscheme solarized
" let g:airline_theme='one'
"
" colorscheme one

set background=dark
"指定配色方案为256
set t_Co=256
"let g:solarized_termcolors=16

let g:solarized_termcolors=256
"设置VIM状态栏
" set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
" 状态行显示的内容
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"设置状态栏主题风格
" let g:Powerline_colorscheme='solarized256'

" 设置 gvim 显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 11.5
" 禁止折行
"set nowrap
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
"set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

"注释行换行不再有注释符号,第一种在js中没用,暂时用第二种
au FileType java,jsp,js setlocal comments-=:// comments+=f://
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"粘贴模式
":set paste

" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Bundle 'VundleVim/Vundle.vim'
Bundle 'Valloric/YouCompleteMe'
"右侧边栏,方便对方法的罗列和浏览
Bundle 'majutsushi/tagbar'
"生成c语言的标签文件，实现相关c文件之间的跳转
"目前好像用不到,后面慢慢研究,好像有更好的替代品,先不注释掉https://github.com/szw/vim-tags代替,可以了解下
Bundle 'vim-scripts/ctags.vim'
Bundle 'Lokaltog/vim-powerline'
"光标快速移动插件
"快捷键是
"快捷键<leader><leader>w(即,,w)和<leader><leader>b(即,,b)
"助记: word and back
Bundle 'Lokaltog/vim-easymotion'
"侧边文件树形导航u,可以向上切换根目录
Bundle 'scrooloose/nerdtree'
"为所有标签打开同一个导航
"Bundle 'jistr/vim-nerdtree-tabs'
"map <Leader>n <plug>NERDTreeTabsToggle<CR>
" 这个插件可以显示文件的Git增删状态
Plugin 'Xuyuanp/nerdtree-git-plugin'

"语法检查工具,临时关闭报错窗口:lclose
Bundle 'scrooloose/syntastic'

"Python模式，一个用于Vim的Python IDE,注释掉报错
Bundle 'klen/python-mode'

"文本注释插件
 Bundle 'vim-scripts/tComment'
"可以自动关闭引号，圆括号，括号
Bundle 'jiangmiao/auto-pairs'
"js检查插件
"Bundle 'wookiehangover/jshint.vim'
"文件重命名插件
Bundle 'danro/rename.vim'
"将当前窗口显示最大化   
"Bundle 'vim-scripts/ZoomWin'
"可以方便使用 Ctrl-h,ctrl-j,ctrl-k,ctrl-l 来在各个 vim 和 tmux pannel 之间跳转
Bundle 'christoomey/vim-tmux-navigator'
"junit 测试工具
Bundle 'wsdjeg/JavaUnit.vim'
"这是vim-javacomplete2，一个需要vim 7的Java的omni-completion插件
"并不知道这个插件有什么用,只是在测试工具junit中介绍需要的插件,
"如果有问题可以删除
"应该是Java自动提示功能
Bundle 'artur-shaik/vim-javacomplete2'
"平滑滚动
Bundle 'terryma/vim-smooth-scroll'
"中文vim帮助目录
Bundle 'asins/vimcdoc'
" ##### 自动根据当前打开文件切换工作目录                                                                                                     
"Bundle 'Shougo/unite.vim'
"缩进小细线
Bundle 'yggdroot/indentline'

"主题1
 Plugin 'altercation/vim-colors-solarized'

"主题2
" Bundle 'rakr/vim-one'

"高光标签插件
Plugin 'magic-dot-files/TagHighlight'

"代码块插件
Plugin 'SirVer/ultisnips'

"代码块集合
Plugin 'honza/vim-snippets'
"数据库插件
Bundle 'vim-scripts/dbext.vim'
"模糊文件查询
Plugin 'kien/ctrlp.vim'
"Vim自动生成tags
Plugin 'ludovicchabant/vim-gutentags'
"========================web开发插件开始=====================
"javascript语法高亮
Bundle 'mxw/vim-jsx'
"Vim中极大地改进了Javascript缩进和语法支持
"js对齐上有bug,先用一段时间,过后删除
"Bundle 'pangloss/vim-javascript'
" 插件列表结束
"色彩高亮
Bundle 'gorodinskiy/vim-coloresque'
"与YouCompleteMe结合对JavaScript补全
Bundle 'marijnh/tern_for_vim'
"缩进,
Bundle 'lukaszb/vim-web-indent'
"HTML中ul>li*3这种快捷写法插件
Bundle 'mattn/emmet-vim'
"javascript高亮语法
Bundle 'jelera/vim-javascript-syntax'
"CSS语法高亮
Bundle 'hail2u/vim-css3-syntax'
"html5语法
Bundle 'othree/html5.vim'
"标签自动补全
Bundle 'docunext/closetag.vim'


"========================web开发插件结束=====================
call vundle#end()
filetype plugin indent on


"快捷键
"" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p

"test the current methond,测试当前方法
nnoremap <Leader>jv :JavaUnitExec<CR>
"test specification method,测试规范方法(除主方法外)
"example JavaUnitExec testMethod1 testMethod2 testMethod3 ...
"run the main methon of current class,测试主方法
nnoremap <Leader>jm :JavaUnitTestMain<CR>
"run all the testMethod in the current file ,测试当前文件所有方法,除了主方法
" nnoremap jam :JavaUnitTestAll<CR>
"进入文件目录,编译该文件
nnoremap <Leader>jj :JavaUnitServerCompilePro<CR>
"部署应用
nnoremap <Leader>jd :JavaUnitTest<CR>
nmap <Leader>m %

"平滑滚动插件的快捷键
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"tagBar对方法的罗列,方便调用方法时调用
nmap  <Leader>t :TagbarToggle <CR>
noremap <Leader>n :tabnew<CR>
"切换tab页:
nmap <Leader>1 1gt
nmap <Leader>1 1gt
nmap <Leader>2 2gt
nmap <Leader>3 3gt
nmap <Leader>4 4gt
nmap <Leader>5 5gt
nmap <Leader>6 6gt
nmap <Leader>7 7gt
nmap <Leader>8 8gt
nmap <Leader>9 9gt
nmap <Leader>0 :tablast<CR>

"将当前打开的文件设置为工作路径
noremap <Leader>ch :set autochdir<CR>


"插件配置
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=0
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle


" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
"

nnoremap <C-n> :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=45
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
"显示行号
let NERDTreeShowLineNumbers = 1
"忽略特定文件和目录
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store','\.project$','\.settings$' ]
:set modifiable

"插入javascript
inoremap <Leader>sc <script type="text/javascript"></script>
"插入css
inoremap <Leader>st <style type="text/css"></style>
"插入link
inoremap<Leader>li <link rel="stylesheet" type="text/css" href="">
"插入jquery
inoremap<Leader>jq <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
"插入main函数
inoremap<Leader>ma public static void main(String[] args)

nnoremap<Leader>gc ^i<%-- <esc>$a --><esc>
nnoremap<Leader>hc ^i<!-- <esc>$a --><esc>
"====================================tmux=======================================

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

"在从Vim导航到tmux窗格之前写入所有缓冲区
let g:tmux_navigator_save_on_switch = 2

"查单词
nmap <Leader>y :!echo --==<C-R><C-w>==-- ;ici <C-R><C-W><CR>

"空格直接进入命令行模式
nmap <space> :
vmap <space> :
"将当前行放中间
nnoremap j jzz 
nnoremap k kzz
"====================================tmux=======================================

" YCM 补全菜单配色
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
"inoremap <leader><Tab> <C-x><C-o>
"回车即选中项
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
"highlight PmenuSel ctermfg=2 ctermbg=3 guibg=#AF3400 guifg=#10946f

"20180801
"屏蔽YCM 自动弹出函数原型预览窗口
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
"屏蔽YCM默认诊断信息
let g:ycm_show_diagnostics_ui = 1



"下列定义如果不卡可以放开
"========================================试验================================

" 补全功能在注释中同样有效
"let g:ycm_complete_in_comments=1
"let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
"let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
"set tags+=/data/misc/software/misc./vim/stdcpp.tags
"set tags+=/data/misc/software/misc./vim/stdcpp.tags
" 补全内容不以分割子窗口形式出现，只显示补全列表
"set completeopt-=preview
"set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全			
let g:ycm_seed_identifiers_with_syntax=1
" let g:ycm_seed_identifiers_with_syntax=0
"禁用Java语法其他诊断
"let g:syntastic_java_checkers  = []
"禁用语法检查
"let g:ycm_show_diagnostics_ui = 0
"禁用ycm的语法错误检测提
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0

"========================================试验================================

"总是打开Location List（相当于QuickFix）窗口，如果你发现syntastic因为与其他插件冲突而经常崩溃，将下面选项置0
let g:syntastic_always_populate_loc_list = 1
"自动打开Locaton List，默认值为2，表示发现错误时不自动打开，当修正以后没有再发现错误时自动关闭，置1表示自动打开自动关闭，0表示关闭自动打开和自动关闭，3表示自动打开，但不自动关闭
let g:syntastic_auto_loc_list = 1
"打开文件时自动进行检查
let g:syntastic_check_on_open = 1
"实时检查设为0，关闭设为1
let g:syntastic_check_on_wq = 1

"打开chrome
nnoremap <Leader>c :exec '!exec open %'<CR>

"==============================================vim-javacomplete2=======================================================START
"将其添加到您的.vimrc文件中：
"
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"有一个新类的时候自动导包
"let g:JavaComplete_InsertImports = 0

"tagbar{{{
	"按F9即可打开tagbar界面
    nmap <C-t> :TagbarToggle<CR>
	"tagbar以来ctags插件
    let g:tagbar_ctags_bin = 'ctags'                
	"让tagbar在页面左侧显示，默认右边
	let g:tagbar_left = 0                           
	"设置tagbar的宽度为30列，默认40
	let g:tagbar_width = 30                         
	"这是tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
	let g:tagbar_autofocus = 1                      
	"设置标签排序,默认排序
	let g:tagbar_sort = 0                           
	"let g:tagbar_left = 0

	"设置tags选项为当前目录下的tags文件
	set tags=tags	
"}}}

"UltiSnips{{{
    "插入模式下直接通过<C-z>键来触发UltiSnips的代码块补全
	let g:UltiSnipsExpandTrigger="<C-l>"
	" let g:UltiSnipsJumpForwardTrigger="<c-b>"
	" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"}}}

"============================数据库插件配置===============================
let g:dbext_default_profile_mySQL = 'type=MYSQL:user=root:passwd=mysql:dbname=web08'

"============================CTRlP插件配置===============================

"改变CTLRP启动默认映射和默认的命令，vimrc中添加
"模糊搜索当前目录及其子目录下的所有文件
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"模糊搜索最近打开的文件(MRU)
map <leader>f :CtrlPMRU<CR>
"搜索隐藏下列后缀名的文件
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll|class)$',
	\ }
"使用该选项指定当使用 <c-y> 打开新建的文件时，文件的打开方式: >
"  t - 在新页签中。
"  h - 在新的水平分割窗口。
"  v - 在新的竖直分割窗口。
"  r - 在当前窗口。
let g:ctrlp_open_new_file = 'tv'

"t - 每个文件在一个新页签中。
"h - 每个文件在一个新的水平分割窗口中。
"v - 每个文件在一个新的竖直分割窗口中。
"i - 所有的文件在隐藏的缓冲区中。
"j - 打开以后，跳转到第一个打开的页签或者窗口。
"r - 在当前窗口打开第一个文件，其他文件根据同时出现的"h"，"v"和"t"中的一个，
"  在新的分割窗口或者页签中打开。
let g:ctrlp_open_multiple_files = 'vj'
"当引用没有明确的开始目录时，CTLRP会按照以下值来设定工作目录
let g:ctrlp_working_path_mode = 'ra'
"‘c’--当前文件的目录
"‘a’--当前文件的目录，除非它是cwd的子目录
"‘r’--最近的当前文件，包含了这些.git .hg .svn .bzr_darcs文件或目录
"‘w’--和r类似，以cwd开始搜索，而非以当前文件目录

"========================vim自定义函数试验开始=====================
" cd :                              改变vim的当前工作路径 
" lcd：                            改变当前窗口的工作路径 
" pwd:                            查看当前的工作路径 
" set autochdir:              自动设当前编辑的文件所在目录为当前工作路径
" let g:Work = "~/Documents/JavaWeb01"
" let g:Test = g:Work."/test/"
" let g:Pt = g:Work."/test/"
" function Cw(dir)
"      execute ":cd  ".a:dir
"  endfunction
" call Cw(Test)
"========================vim自定义函数试验结束=====================
"========================pangloss/vim-javascript配置====================
"控制某些语法突出显示插件
let g:javascript_plugin_jsdoc = 1

"========================vim-gutentags插件的配置"========================
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

