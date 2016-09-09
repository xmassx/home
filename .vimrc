"'-------------------------
" Базовые настройки
"-------------------------
" Включаем несовместимость настроек с Vi (ибо Vi нам и не понадобится).
set nocompatible
"set verbose=4
" Показывать положение курсора всё время.
set ruler  

" Показывать незавершённые команды в статусбаре
set showcmd  

" Показываем табы
set list

" Включаем нумерацию строк
set nu

" Текст вставляется с сохранением отступа
" set nppaste
set nopaste

" Настраиваем к-во символов пробелов, для таб.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
"set noet

" Переносим длинные строки
set wrap

"Включаем автоотступы для новых строк, а так же делаем перенос в стиле Си
set ai
set cin

"Настраиваем подсветку результатов поиска и совпадения скобок
set showmatch
set hlsearch
set incsearch
set ignorecase

" Выключаем надоедливый "звонок"
set noerrorbells
set novisualbell
set t_vb=   
set tm=500

" Отключение функционала мыши вне графического режима.
if !has('gui_running')
	set mouse= 
endif

" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
" когда переключаешься между ними
set hidden

"Устанавливаем историю на 700 линий.
set history=700

"Включаем автообновление документа, если он был изменен извне
set autoread

"Переназначаем кнопку пользовательских функций на запятую
"let mapleader = ","
"let g:mapleader = ","

"Быстрое сохранение
nmap <leader>w :w!<cr>

"Включаем классную менюшку
set wildmenu
set wildmode=list:longest,full

"устанавливаем высоту сомандного бара 
set cmdheight=2

"заставляем backspace работать так, как нужно
set backspace=eol,start,indent
set whichwrap+=<,>,[,]

"Устанавливаем ленивую перерисовку при отработке макросов
set lazyredraw

"Более привычные регулярки, для них нужна магия ^_^
set magic

"подсвечиваем скобки, когда на них курсор
set showmatch

"""""""""""""""""""""""""""""
" Всякая подсветкая 
" и шрифты
"""""""""""""""""""""""""""""

" " Разные шрифты в разных системах.
" if has('gui')
" "	colorscheme darkblue 
" 	if has('win32')
" 		set guifont=Lucida_Console:h10:cRUSSIAN::
" 	else
" 		set guifont=Terminus\ 9
" 	endif
" endif

"Включаем подсветку синтакса
syntax enable
set background=dark
colorscheme desert

"Вырубаем нафиг в гуях всякое
if has('gui')
	set guioptions-=T
	set guioptions+=e
	set t_Co=256
	set guitablabel=%M\ %t
endif

" Порядок применения кодировок и формата файлов
set ffs=unix,dos,mac
set fencs=utf-8,cp12.51,koi8-r,ucs-2,cp866

" умолчальная кодировка utf8
set encoding=utf8
set fileencodings=utf8,cp1251

"включаем фолдинг (сворачивание блоков) и делаем его ручным, 
"а так же устанавливаем размер колноки для плюсиков(блок свернут)
set foldmethod=manual
set foldcolumn=3



"Отключаем временные файлы кроме бэкапов
set nobackup
set nowb
set noswapfile

" сохранять умные резервные копии ежедневно
" function! BackupDir()
"     " определим каталог для сохранения резервной копии
"     let l:backupdir=$HOME.'/.vim/backup/'.
"             \substitute(expand('%:p:h'), '^'.$HOME, '~', '')
" 
"     " если каталог не существует, создадим его рекурсивно
"     if !isdirectory(l:backupdir)
"         call mkdir(l:backupdir, 'p', 0700)
"     endif
" 
"     " переопределим каталог для резервных копий
"     let &backupdir=l:backupdir
" 
"     " переопределим расширение файла резервной копии
"     let &backupext=strftime('~%Y-%m-%d~')
" endfunction

" выполним перед записью буффера на диск
" autocmd! bufwritepre * call BackupDir()

""""""""""""""""""""""
" Упрощаем жизнь 
" мапы для перемещний и прочего
""""""""""""""""""""""

"Шняга для поиска в визуальном режиме, удобная. * и # для поиска выделенного далее по тексту
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"Назначим <SPACE> для поиска и Ctrl-<SPACE> для обратного поиска
" map <space> /
" map <c-space> ?

"Упрощение перемещения между сплитами
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Оперируем табами с помощью <leader>:
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
nmap <leader>jj 	:tabprev
nmap <leader>jk 	:tabnext

"Открываем проводник для этой директории в новом табе
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" " Задаем собственные функции для назначения имен заголовкам табов -->
"      function MyTabLine()
"          let tabline = ''
" 
"         " Формируем tabline для каждой вкладки -->
"              for i in range(tabpagenr('$'))
"                 " Подсвечиваем заголовок выбранной в данный момент вкладки.
"                  if i + 1 == tabpagenr()
"                      let tabline .= '%#TabLineSel#'
"                  else
"                      let tabline .= '%#TabLine#'
"                  endif
" 
"                 " Устанавливаем номер вкладки
"                  let tabline .= '%' . (i + 1) . 'T'
" 
"                 " Получаем имя вкладки
"                  let tabline .= ' %{MyTabLabel(' . (i + 1) . ')} |'
"              endfor
"         " Формируем tabline для каждой вкладки <--
" 
"         " Заполняем лишнее пространство
"          let tabline .= '%#TabLineFill#%T'
" 
"         " Выровненная по правому краю кнопка закрытия вкладки
"          if tabpagenr('$') > 1
"              let tabline .= '%=%#TabLine#%999XX'
"          endif
" 
"          return tabline
"      endfunction
" 
"      function MyTabLabel(n)
"          let label = ''
"          let buflist = tabpagebuflist(a:n)
" 
"         " Имя файла и номер вкладки -->
"              let label = substitute(bufname(buflist[tabpagewinnr(a:n) - 1]), '.*/', '', '')
" 
"              if label == ''
"                  let label = '[No Name]'
"              endif
" 
"              let label .= ' (' . a:n . ')'
"         " Имя файла и номер вкладки <--
" 
"         " Определяем, есть ли во вкладке хотя бы один
"         " модифицированный буфер.
"         " -->
"              for i in range(len(buflist))
"                  if getbufvar(buflist[i], "&modified")
"                      let label = '[+] ' . label
"                      break
"                  endif
"              endfor
"         " <--
" 
"          return label
"      endfunction
" 
"      function MyGuiTabLabel()
"          return '%{MyTabLabel(' . tabpagenr() . ')}'
"      endfunction
" 
"      set tabline=%!MyTabLine()
"      set guitablabel=%!MyGuiTabLabel()
" " Задаем собственные функции для назначения имен заголовкам табов <--

" Возвращает к последней позиции при открытии буфера
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
	      \   exe "normal! g`\"" |
		       \ endif

"всегда показывать status line
set laststatus=2

"форматирование status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %1*%{CurTime()}%*\ %b\ 0x%B\ %l,%c%V\ %P
"функция для вывода времени в строке состояния.
fun! CurTime()
	let ftime=""
	let ftime=ftime." ".strftime("%H:%M:%S")
	return ftime
endf

"задаем правила поиска для всяких поисковых команд: gf, [f, ]f, ^Wf, :find, :sfind, :tabfind и других
set path=.,,**

" Делаем файлы сценариев исполняемыми
" au BufWritePost * if getline(1) =~ "^#!.*/bin/"|silent !chmod u+x %|endif

"восстановление фолдов
autocmd BufWritePre *.* mkview
autocmd BufReadPost *.* silent loadview 

"патоген он такой
"для установки следующая паста:
"mkdir -p ~/.vim/autoload ~/.vim/bundle && \
"curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
execute pathogen#infect('bundle/{}')
syntax on
filetype plugin indent on

" F12 - для работы с файлами в различных кодировках
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r  :e ++enc=koi8-r<CR>
menu Encoding.cp1251  :e ++enc=cp1251<CR>
menu Encoding.cp866   :e ++enc=cp866<CR>
menu Encoding.ucs-2le :e ++enc=ucs-2le<CR>
menu Encoding.utf-8   :e ++enc=utf-8<CR>
map <F12> :emenu Encoding.<Tab>


" syntastistic щит
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" disable puppetlint, wanna enable? just comment line 
let g:syntastic_puppet_checkers=['puppet']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
if exists("t:expl_buf_num")
	let expl_win_num = bufwinnr(t:expl_buf_num)
if expl_win_num != -1
	let cur_win_nr = winnr()
exec expl_win_num . 'wincmd w'
close
exec cur_win_nr . 'wincmd w'
unlet t:expl_buf_num
else
unlet t:expl_buf_num
endif
else
exec '1wincmd w'
Vexplore
let t:expl_buf_num = bufnr("%")
endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>


"Fold all f*cking comments function, don't work in cf actualy.
function! ToggleComments()
	set fdm=expr
	set fde=getline(v:lnum)=~'^\\s#'?1:getline(prevnonblank(v:lnum))=~'^\\s#'?1:getline(nextnonblank(v:lnum))=~'^\\s*#'?1:0
	set fdm=manual
endfunction
map <leader>zf :call ToggleComments()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Default to tree mode
let g:netrw_liststyle=3

" Change directory to the current buffer when opening files.
" set autochdir

map <F4> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
