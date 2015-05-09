set PIPESRC=src\pipes
set STAGESRC=src\stages
if not exist build mkdir build

cd "%PIPESRC%"
echo Making core classes
call make base
cd ..\stages
echo Making stages
call make
cd ..\tests
echo Making tests
call make
cd ..\pipes
echo Making aux classes
call make
cd ..\..
java -cp "build;%CLASSPATH%" org.netrexx.njpipes.pipes.compiler njp
if "%1"=="all" goto jar
if "%1"=="jar" goto jar
goto next
:jar
call bin\mkjar
:next
if "%1"=="jar" goto eoj
if "%1"=="" goto eoj
echo building examples
cd src\examples
for %%f in (*.njp) do call ..\..\bin\pipe %%f
cd ..
:eoj
