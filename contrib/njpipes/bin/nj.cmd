rem copy d:\etc\njpipes.html
rem copy d:\etc\readme.njp

del e:\dl\njpipes.zip
del e:\njpipes%1.zip

zip e:\njpipes%1.zip CopyLeft.txt pipe.cmd pipe.bat njpipesC.jar pipes.cnf mk.njp njp.njp findtext.njp sqlselect.properties pipes\StageError.nrx pipes\DString.nrx pipes\IRange.nrx pipes\RingBuf.nrx pipes\utils.nrx pipes\_stage.nrx pipes\RunnablePool.nrx pipes\ThreadPool.nrx stages\*.nrx stages\*.njp stages\*.cnf examples\*.cnf examples\*.njp tests\*.nrx examples\*.data

zip -j e:\dl\njpipes.zip njpipes.html readme.txt faq.txt template*.nrx e:\njpipes%1.zip
