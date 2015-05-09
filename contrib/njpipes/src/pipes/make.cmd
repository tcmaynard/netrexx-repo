set NETREXX_JAVA=-mx64m

if "%1"=="" goto all

del *.class
del *.crossref
del *.java

java -ms4M %netrexx_java% COM.ibm.netrexx.process.NetRexxC -savelog -nocompile link pipe _stage stage StageError node utils DString IRange ringBuf ThreadPool ThreadQ RunnablePool
ren *.java.keep *.
javac -d ..\..\build -O -deprecation link.java pipe.java _stage.java stage.java StageError.java node.java utils.java DString.java IRange.java RingBuf.java ThreadPool.java ThreadQ.java RunnablePool.java

echo Now build the stages and tests
goto eoj

:all

set netrexx_java=-mx64m -cp "..;..\..\build;%CLASSPATH%"
call nrc -nocompile -savelog compiler filterNjp pipe2nrx processNjp readconfig readgroup writepipe
ren *.java.keep *.
javac -cp "..;..\..\build;%CLASSPATH%" -d ..\..\build -O -deprecation compiler.java filterNjp.java pipe2nrx.java processNjp.java readconfig.java readgroup.java writepipe.java

:eoj
