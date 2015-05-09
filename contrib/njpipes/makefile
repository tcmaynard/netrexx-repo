JAR_NAME := njpipesC.jar

.nrx.class:
	$(COMPILE_COMMAND) $< $(COMPILE_FLAGS)
	mv $*.java.keep $*.java

.java.class:
	javac $*.java

NRX_SRC		:= $(wildcard *.nrx)
NRX_OBJS	:= $(NRX_SRC:.nrx=.class)
JAVA_SRC	:= $(wildcard *.java)
JAVA_OBJS	:= $(JAVA_SRC:.java=.class)
PLFILES		:= $(wildcard *.pl)
PIPESRC         := src/pipes/
STAGESRC        := src/stages/

.SUFFIXES: .nrx .nry .njp .class .skel .xsl .java .pl


all::	pipes stages pphase2 jar

pipes::
	mkdir -pv build
	mkdir -pv build/lib
	java -cp ~/lib/NetRexxC.jar:. org.netrexx.process.NetRexxC -binary -warnexit0 -nocompile -replace -nocrossref $(PIPESRC)link $(PIPESRC)pipe $(PIPESRC)_stage $(PIPESRC)stage $(PIPESRC)StageError $(PIPESRC)node $(PIPESRC)utils $(PIPESRC)DString $(PIPESRC)IRange $(PIPESRC)RingBuf $(PIPESRC)ThreadPool $(PIPESRC)ThreadQ $(PIPESRC)RunnablePool
	ls $(PIPESRC)*.java.keep | cut -f1-2 -d. | xargs -I{} mv {}.keep {}
	javac -cp ~/lib/NetRexxC.jar:. -d build -deprecation $(PIPESRC)link.java $(PIPESRC)pipe.java $(PIPESRC)_stage.java $(PIPESRC)stage.java $(PIPESRC)StageError.java $(PIPESRC)node.java $(PIPESRC)utils.java $(PIPESRC)DString.java $(PIPESRC)IRange.java $(PIPESRC)RingBuf.java $(PIPESRC)ThreadPool.java $(PIPESRC)ThreadQ.java $(PIPESRC)RunnablePool.java

stages::
	java -cp ~/lib/NetRexxC.jar:./build org.netrexx.process.NetRexxC -nocompile -replace -warnexit0 -nocrossref $(STAGESRC)*.nrx
	ls $(STAGESRC)*.java.keep | cut -f1-2 -d. | xargs -I{} mv {}.keep {}
	javac -cp ~/lib/NetRexxC.jar:./build -d build $(STAGESRC)*.java

pphase2::
	java -cp ~/lib/NetRexxC.jar:./build org.netrexx.process.NetRexxC -nocompile -replace -warnexit0 $(PIPESRC)compiler $(PIPESRC)filterNjp $(PIPESRC)pipe2nrx $(PIPESRC)processNjp $(PIPESRC)readconfig $(PIPESRC)readgroup $(PIPESRC)writepipe
	ls $(PIPESRC)*.java.keep | cut -f1-2 -d. | xargs -I{} mv {}.keep {}
	javac -cp ~/lib/NetRexxC.jar:./build -d build $(PIPESRC)compiler.java $(PIPESRC)filterNjp.java $(PIPESRC)pipe2nrx.java $(PIPESRC)processNjp.java $(PIPESRC)readconfig.java $(PIPESRC)readgroup.java $(PIPESRC)writepipe.java

jar::
	jar cvf $(JAR_NAME) -C build/ .
	mv $(JAR_NAME) build/lib

#
# target clean removes compiled products
#
.PHONY: clean
clean: 
	rm -rf build




