@if exist .\pipes.cnf goto ok
echo Build this directory's default pipe.cnf
@echo import pipes.  >  pipes.cnf
@echo import stages. >> pipes.cnf
@echo import tests.  >> pipes.cnf
:ok
@if "%csave%" == "" SET csave=%classpath%
@set classpath=d:\njpipes;d:\njpipes\njpipesC.jar;%csave%
@java pipes.compiler %1
