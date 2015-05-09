del *.class
del *.crossref

set netrexx_java=-cp "..;..\..\build;%CLASSPATH%"
call netrexxc -nocompile -savelog *.nrx
ren *.java.keep *.
javac -cp "..;..\..\build;%CLASSPATH%" -d ..\..\build -O -deprecation *.java

del *.crossref
