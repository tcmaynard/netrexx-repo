del *.class
del *.java
del *.nrx
del *.log

*en linkpipe.njx   *.njp
*en linktest.njx   *.njp
*en prefixtest.njx *.njp

*ava njp -savelog linkpipe linktest prefixtest
*en netrexxc.log prefixtest.log

*en linkpipe.njp   *.njx
*en linktest.njp   *.njx
*en prefixtest.njp *.njx

java mkClass "*.njp"
