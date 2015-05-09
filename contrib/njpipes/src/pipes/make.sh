set NETREXX_JAVA=-mx64m

if "%1"=="" goto all

del *.class
del *.crossref
del *.java

java -ms4M %netrexx_java% COM.ibm.netrexx.process.NetRexxC -savelog -nocompile link pipe _stage stage StageError node utils DString IRange RingBuf ThreadPool ThreadQ RunnablePool
ls *.java.keep | cut -f1-2 -d. | xargs -I{} mv {}.keep {}
javac -O -deprecation link.java pipe.java _stage.java stage.java StageError.java node.java utils.java DString.java IRange.java RingBuf.java ThreadPool.java ThreadQ.java RunnablePool.java

echo Now build the stages & tests
goto eoj

:all

nrc -savelog compiler filterNjp pipe2nrx processNjp readconfig readgroup writepipe

:eoj
exit
