let s:save_cpo = &cpo
set cpo&vim

if exists('g:JavaUnit_autoload')
    finish
endif
let g:JavaUnit_autoload = 1

let s:Fsep = javaunit#util#Fsep()
let s:Psep = javaunit#util#Psep()

let g:JavaUnit_Home = fnamemodify(expand('<sfile>'), ':p:h:h:gs?\\?'. s:Fsep. '?')

if exists("g:JavaUnit_custom_tempdir")
    let s:JavaUnit_tempdir = g:JavaUnit_custom_tempdir
else
    let s:JavaUnit_tempdir = g:JavaUnit_Home .s:Fsep .'bin'
endif

let s:JavaUnit_Home_lib = g:JavaUnit_Home .s:Fsep .'lib/*'


let s:filepath = expand('%:p')

let s:filetype = expand('%:e')
		
let s:cppath = split(s:filepath, "src")[0]

let s:webapp = split(s:cppath,s:Fsep)[4]



let s:JavaUnit_ProPath = s:JavaUnit_tempdir.s:Fsep.s:webapp

let s:apache_webapps_pro = '/Users/mymac/Library/apache-tomcat-7.0.90/webapps/'.split(s:cppath,s:Fsep)[4]

function! javaunit#Test() abort
		let cmd='rm -rf '.s:apache_webapps_pro.'&&mkdir '.s:apache_webapps_pro.'&& cd '.s:cppath.'&& cp -rf WebContent/*  /Users/mymac/Library/apache-tomcat-7.0.90/webapps/'.split(s:cppath,s:Fsep)[4].'&& cp -rf '.s:JavaUnit_tempdir.'/'.s:webapp.' /Users/mymac/Library/apache-tomcat-7.0.90/webapps/'.s:webapp.'/WEB-INF/classes/ && cp -rf '.s:JavaUnit_tempdir.'/c3p0-config.xml /Users/mymac/Library/apache-tomcat-7.0.90/webapps/'.s:webapp.'/WEB-INF/classes/&& cp -rf /Users/mymac/Library/apache-tomcat-7.0.90/lib/jsp-api.jar /Users/mymac/Library/apache-tomcat-7.0.90/webapps/'.s:webapp.'/WEB-INF/lib/&& cp -rf /Users/mymac/Library/apache-tomcat-7.0.90/lib/servlet-api.jar /Users/mymac/Library/apache-tomcat-7.0.90/webapps/'.s:webapp.'/WEB-INF/lib/ && echo "部署成功,请按q键退出"' 
		call javaunit#util#ExecCMD(cmd)
endfunction


let s:JavaUnit_TestMethod_Source =
            \g:JavaUnit_Home
            \.s:Fsep
            \.join(['src' , 'com' , 'wsdjeg' , 'util' , '*.java'],s:Fsep)

function! javaunit#Compile() abort
    silent exec '!javac -encoding utf8 -d '.s:JavaUnit_tempdir.' '.s:JavaUnit_TestMethod_Source 
endfunction



function javaunit#CompilePro()
	" if globpath(s:JavaUnit_ProPath.'/.', '*') != ''
	" if findfile(s:webapp, s:JavaUnit_tempdir."/.") == s:webapp
	if !empty(glob(s:JavaUnit_ProPath))
		let cmd="javac -d '"
				\.s:JavaUnit_ProPath
				\."' *.java"
				\."&& echo '编译成功,请按q键退出'"
		" let cmd = "echo 111"
	else
		let cmd="mkdir ".s:JavaUnit_ProPath."&& javac -d '"
				\.s:JavaUnit_ProPath
				\."' *.java"
				\."&& echo '编译成功,请按q键退出'"
		" let cmd = "echo 222"
	endif
    call javaunit#util#ExecCMD(cmd)
endfunction


if findfile(s:JavaUnit_tempdir.join(['','com','wsdjeg','util','TestMethod.class'],s:Fsep))==""
    call javaunit#Compile()
endif


function javaunit#TestMethod(args,...)
    let line = getline(search("package","nb",getline("0$")))
    if line != ''
        let currentClassName = split(split(line," ")[1],";")[0].".".expand("%:t:r")
    else
        let currentClassName = expand("%:t:r")
    endif
    if a:args == ""
        let cwords = split(tagbar#currenttag('%s', '', ''),'(')[0]
        if filereadable('pom.xml')
            let cmd="java -cp '"
                        \.s:JavaUnit_tempdir
                        \.s:Psep
                        \.getcwd()
                        \.join(['','target','test-classes'],s:Fsep)
                        \.s:Psep
                        \.get(g:,'JavaComplete_LibsPath','.')
                        \."' com.wsdjeg.util.TestMethod "
                        \.currentClassName
                        \.' '
                        \.cwords
        else
            let cmd="java -cp '"
                        \.s:JavaUnit_ProPath
						\.s:Psep
						\.s:JavaUnit_tempdir
                        \.s:Psep
                        \.get(g:,'JavaComplete_LibsPath','.')
                        \.s:Psep
                        \.s:JavaUnit_Home_lib
                        \."' com.wsdjeg.util.TestMethod "
                        \.currentClassName
                        \.' '
                        \.cwords
        endif
        call javaunit#util#ExecCMD(cmd)
    else
        if filereadable('pom.xml')
            let cmd="java -cp '"
                        \.s:JavaUnit_tempdir
                        \.s:Psep
                        \.getcwd()
                        \.join(['','target','test-classes'],s:Fsep)
                        \.s:Psep
                        \.get(g:,'JavaComplete_LibsPath','.')
                        \."' com.wsdjeg.util.TestMethod "
                        \.currentClassName
                        \.' '
                        \.a:args
        else
            let cmd="java -cp '"
                        \.s:JavaUnit_ProPath
						\.s:Psep
                        \.s:JavaUnit_tempdir
                        \.s:Psep
                        \.get(g:,'JavaComplete_LibsPath','.')
                        \.s:Psep
                        \.s:JavaUnit_Home_lib
                        \."' com.wsdjeg.util.TestMethod "
                        \.currentClassName
                        \.' '
                        \.a:args
        endif
        call javaunit#util#ExecCMD(cmd)
    endif
endfunction

function javaunit#TestAllMethods()
    let line = getline(search("package","nb",getline("0$")))
    let currentClassName = split(split(line," ")[1],";")[0].".".expand("%:t:r")
    let cmd="java -cp '"
				\.s:JavaUnit_ProPath
				\.s:Psep
                \. s:JavaUnit_tempdir
                \.s:Psep
                \.get(g:,'JavaComplete_LibsPath' ,'.') 
                \.s:Psep
                \.s:JavaUnit_Home_lib
                \."' com.wsdjeg.util.TestMethod " 
                \. currentClassName
    call javaunit#util#ExecCMD(cmd)
endfunction


function javaunit#MavenTest()
    let line = getline(search("package","nb",getline("0$")))
    let currentClassName = split(split(line," ")[1],";")[0].".".expand("%:t:r")
    let cmd = 'mvn test -Dtest='.currentClassName.'|ag --nocolor "^[^[]"'
    call unite#start([['output/shellcmd', cmd]], {'log': 1, 'wrap': 1})
endfunction

function javaunit#MavenTestAll()
    let cmd = 'mvn test|ag --nocolor "^[^[]"'
    call javaunit#util#ExecCMD(cmd)
endfunction

function javaunit#NewTestClass(classNAME)
    let filePath = expand("%:h")
    let flag = 0
    let packageName = ''
    for a in split(filePath,s:Fsep)
        if flag
            if a == expand("%:h:t")
                let packageName .= a.';'
            else
                let packageName .= a.'.'
            endif
        endif
        if a == "java"
            let flag = 1
        endif
    endfor
    call append(0,"package ".packageName)
    call append(1,"import org.junit.Test;")
    call append(2,"import org.junit.Assert;")
    call append(3,"public class ".a:classNAME." {")
    call append(4,"@Test")
    call append(5,"public void testM() {")
    call append(6,"//TODO")
    call append(7,"}")
    call append(8,"}")
    call feedkeys("gg=G","n")
    call feedkeys("/testM\<cr>","n")
    call feedkeys("viw","n")
    "call feedkeys("/TODO\<cr>","n")
endfunction
function! javaunit#Get_method_name() abort
    let name = 'sss'
    return name
endfunction

function! javaunit#TestMain(...) abort
    let line = getline(search("package","nb",getline("0$")))
    if line != ''
        let currentClassName = split(split(line," ")[1],";")[0].".".expand("%:t:r")
    else
        let currentClassName = expand("%:t:r")
    endif
    if filereadable('pom.xml')
        let cmd="java -cp '"
                    \.s:JavaUnit_tempdir
                    \.s:Psep
                    \.getcwd()
                    \.join(['','target','test-classes'],s:Fsep)
                    \.s:Psep
                    \.get(g:,'JavaComplete_LibsPath','.')
                    \."' "
                    \.currentClassName
                    \.' '
                    \.(len(a:000) > 0 ? join(a:000,' ') : '')
    else
        let cmd="java -cp '"
					\.s:JavaUnit_ProPath
					\.s:Psep
                    \.s:JavaUnit_tempdir
                    \.s:Psep
                    \.get(g:,'JavaComplete_LibsPath','.')
                    \.s:Psep
                    \.s:JavaUnit_Home_lib
                    \."' "
                    \.currentClassName
                    \.' '
                    \.(len(a:000) > 0 ? join(a:000,' ') : '')
    endif
    call javaunit#util#ExecCMD(cmd)
endfunction

fu! javaunit#GenerateTestMethods()
    let testClassName = expand('%:t:r')
    if stridx(testClassName, 'test') != -1  || stridx(testClassName, 'Test') != -1
        let line = getline(search("package","nb",getline("0$")))
        let testClassName = split(split(line," ")[1],";")[0]."." . testClassName
        if stridx(testClassName, 'Test') == len(testClassName) - 4
            let className = strpart(testClassName, 0,len(testClassName) - 4)
            let cmd="java -cp '"
                        \.s:JavaUnit_tempdir
                        \.s:Psep
                        \.getcwd()
                        \.join(['','target','test-classes'],s:Fsep)
                        \.s:Psep
                        \.get(g:,'JavaComplete_LibsPath','.')
                        \."' com.wsdjeg.util.GenerateMethod "
                        \.className
            let methods =  split(join(systemlist(cmd)),'|')
            let curPos = getpos('.')
            let classdefineline = search("class " . expand('%:t:r'),"nb",getline("0$"))
            for m in methods
                call append(classdefineline, "/* test " . m . " */")
                call append(classdefineline + 1,"public void test" . toupper(strpart(m,0,1)) . strpart(m,1,len(m)) . "() {")
                call append(classdefineline + 2,"//TODO")
                call append(classdefineline + 3,"}")
            endfor
            call feedkeys("gg=G","n")
            call cursor(curPos[1] + 1, curPos[2])
        else
            echohl WarningMsg | echomsg "This is not a testClassName,now only support className end with 'Test'" | echohl None
        endif
    else
        echohl WarningMsg | echomsg "This is not a testClassName" | echohl None
    endif
endf


let &cpo = s:save_cpo
unlet s:save_cpo
