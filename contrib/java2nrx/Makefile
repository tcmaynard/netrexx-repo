all: java2nrx.jar java2nrx.zip java2nrx_src.zip

clean: 
	-rm java2nrx.jar
	-rm java2nrx.zip
	-rm java2nrx_src.zip

always:
	rm java2nrx.jar

java2nrx.jar: 
	ant "compile and build"

java2nrx.zip:  java2nrx.jar readme.txt readme-javaparser.txt java2nrx.bat java2nrx.sh COPYING COPYING.LESSER
	zip java2nrx.zip java2nrx.jar readme.txt readme-javaparser.txt java2nrx.bat java2nrx.sh COPYING COPYING.LESSER

java2nrx_src.zip: java2nrx.zip 
	zip -R java2nrx_src.zip java2nrx.jar readme.txt readme-javaparser.txt java2nrx.bat java2nrx.sh COPYING COPYING.LESSER build.xml Makefile *.java 



