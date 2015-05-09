/*
   MLOCATE REXX
   Mixed case locate pipe filter - this program will ignore case
   while performing an OR locate.
   The LOCATE filter that is supplied is case sensitive.
   The first character is used as the delimiter, so to
   look for multiple different strings you would type something like
   mlocate /abc/123/to be or /xyz/
   this would find all records containing abc or 123 or 'to be or ' or
   xyz.  Of course if you just specify one target that is ok too.
 */

arg args 1 cols rest

    /* handle column range locates */
start = 'START'
if datatype(left(cols,1),'W') then do
   parse var cols start '-' end .
   if end = '' then do
      parse var cols start '.' end .
      if end = '' then len = 1
      else len = end
      end
   else do
      if end = '*' then len = 0
      else len = end - start + 1
      end
   args = rest
   end

parse value strip(args) with 1 dlm 2 args
do i = 1
   parse var args target.i (dlm) args
   if args = '' then leave
   end
'select output 1'   /* see if it is there */
 if rc = 0 then secondary = 1
 else secondary = 0

signal on novalue
signal on error

do forever
  'readto in'
   parse upper var in inn

   if start <> 'START' then do
      if len = 0 then inn = substr(inn,start)
      else inn = substr(inn,start,len)
      end

      /* look for each target until exhausted or hit occurs */
     /* default is secondary output stream */
   if secondary then 'select output 1'
   hit = 0
   do j = 1 to i
      if index(inn,target.j) > 0 then do
          /* output the original record, not uppered one */
        'select output 0'  /* make output go to primary output stream */
         hit = 1
         leave  /* hit occured */
         end
      end
   if hit | secondary then 'output' in
   end
novalue:
error:
exit
