
set deldir=

del *.class
del *.crossref
del *.nrx
del *.log

set path=e:\utils\pipes;%path%
set beginlibpath=e:\utils\pipes

pipe.exe (end ?) dir *.njp /FN ! change /./ / ! specs word1 1 ! sort ! join 20 / / ! specs /java -mx32M njp -gen -savelog / 1 1-* next write /ren netrexxc.log / 1 word1 next /.log/ next ! command ! console >> a.log

del *.crossref

grep Error *.log

if "%1" \== "" test > test.%1 < console.data
if "%1" \== "" testjit > testjit.%1 < console.data

