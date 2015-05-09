del *.java
del *.class
del *.crossref
del *.log

set netrexx_java=-mx48m -cp "..;..\..\build;%CLASSPATH%"

call netrexxc -nocompile -savelog *.nrx
ren *.java.keep *.
javac -cp "..;..\..\build;%CLASSPATH%" -d ..\..\build -O -deprecation *.java

del *.crossref
