Pipes for NetRexx and Java                           
Version 0.60, September 1st, 2011



Copyright (c) E. J. Tomlinson <tomlins@cam.org>, 1997-2011.  All rights reserved


    This code is Beta and will contain bugs.  Use it at your own risk.

    njPipes is Distributed under the ICU LICENSE with
    NO WARRANTIES of ANY kind. See LICENSE for the licence and information
    on using, copying, modifying, and distributing this program.

    Issues can be enterered in the NetRexx issue tracker at
    netrexx.kenai.com. Please indicates that the issue regards njpipes.

Installation and Requirements

    To run Pipes for NetRexx and Java you need both Java and NetRexx runtime
    support installed.  To write your own pipes or stages you need compilers for
    both Java and NetRexx. 

    The core classes for pipes and stages are in njpipesC.jar.  This
    file may be used on the -cp option or added to your CLASSPATH.

    To install create an njpipes directory, cd into it and unzip njpipes.zip.
    Then unzip the versioned njpipes file, unzip njpipes060.zip.  This will build
    the directory structure with with examples, docuementation, the njpipesC.jar,
    a pipe.bat and pipe.cmd.  If you unzipped on a drive other than C: or you
    placed njpipes in a subdirectory, edit the respective platform
    script file (.sh, .cmd, .bat etc) to point to your njpipes.jar and you can start pipeing.

    To test your installation, you can type:
    pipe "(test) literal arg() ! dup 999 ! count words ! console"

    The first time you use the pipe command in a new directory it will
    create a default pipes.cnf file for you.

    If you have the njpipesC.jar on your CLASSPATH you can also use:

    java org.netrexx.njpipes.pipes.compiler (test) literal arg() ! dup 999 ! count words ! console

    You should see a message that the pipe compiler is processing your pipe and
    soon after that messages from the NetRexx compiler as it processes the pipe.

    To run the pipe type:

    java test some words

    The pipe should then output:

    2000

|   If you have had njPipes working and it fails after a reinstall, it may be
|   due to source you have recompiled.  Its a good idea to delete any .class
|   files you have created in the pipes, stages or tests directories.  Also
|   check the readme.  There maybe requirements to recompile some of your
|   pipes.  The stageExit method, now used quite a bit, is a two edged sword.
|   On one hand it generates much faster pipes, on the other hand, it often
|   requires pipes to be recompiled.

