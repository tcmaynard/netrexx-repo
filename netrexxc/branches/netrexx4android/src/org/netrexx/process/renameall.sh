for file in *.tmp ; do mv $file `echo $file | sed 's/\(.*\.\)nrx.tmp/\1nrx/'` ; done