@echo BUILDING ALL SAMPLES
cd first
call build
cd ..
cd compiler
call build
cd ..
cd language
call build
cd ..
cd exceptions
call build
cd ..
cd script
call build
cd ..
@echo Redbook Package
cd redbook
call build
cd ..
@echo GUI ...
cd gui
cd animator
call build
cd ..
cd borderlayout
call build
cd ..
cd cardlayout
call build
cd ..
cd checkbox
call build
cd ..
cd closewindow
call build
cd ..
cd equalsizepanel
call build
cd ..
cd extendedlabel
call build
cd ..
cd fieldselect
call build
cd ..
cd flowlayout
call build
cd ..
cd gridbaglayout
call build
cd ..
cd gridlayout
call build
cd ..
cd guiapp
call build
cd ..
cd guifirst
call build
cd ..
cd imagepanel
call build
cd ..
cd menubar
call build
cd ..
cd messagebox
call build
cd ..
cd photoalbum
call build
cd ..
cd popupmenu
call build
cd ..
cd promptdialog
call build
cd ..
cd simplegridbaglayout
call build
cd ..
cd windowfocus
call build
cd ..
cd windowsupport
call build
cd ..
@echo Done with GUI
cd ..
cd thread
call build
cd ..
cd file
call build
cd ..
cd jdbc
call build
cd ..
cd network
cd net
call build
cd ..
cd url
call build
cd ..
cd rmi
call build
cd ..
cd rmijdbc
call build
cd ..
cd rmichat
call build
cd ..
cd ..
cd cgi
call build
cd ..
@echo NetRexx beans
cd nrxbeans
cd lab
call build
cd ..
cd sample
call build
cd ..
cd ..
@echo DONE WITH BUILD.