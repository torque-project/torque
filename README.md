# torque

The torque project CLI toolchain

The tourque project is an LLVM based clojure compiler. This repository is the
main entry point to clone and build the project.

The project started out in 2016 because of some frustration with the slowness
of ClojureScript in particular. The goal of this project was to bootstrap a working 
REPL that compiles to machine code using LLVM, in less time than it takes to
compile a simple ClojureScript application. In general this goal was met. The torque
compiler currently manages to compile the c++ boot strap code in <8s on my mac book,
interprets the clojure.core code, and compiler once, and then starts a repl, which
in turn compiles the clojure core code. The boot strapping process until a repl
is available currently takes less than 10 seconds.

Besides this purely "for fun" goal, the theory behind the project was that a single 
compiler that targets different back ends would have worked better than Clojure's
current approach, of hosting the language of different platforms. Especially 
considering the possibility to target web assembly, or GPUs using LLVM, makes using
LLVM attractive. Clojure's initial goal to support interaction with the JVM could
have easily been supported once compilation to llvm byte code works.

Fun things this might do in the future. 

* Compile Clojure to GPU code. 
* Compile Clojure to Web Assembly via LLVM.
* Interface with Java via JNI.

## Quick Start

If you don't want to build the project yourself by hand, you can just run

    docker build . -t torque/demo
    docker run --rm -it --entrypoint /bin/zsh torque/demo

in the project root to get a docker container with a built torque environment.

    cd torque
    . ./activate
    target/Linux_unknown/bin/booti bin/repl

will get you into a repl that compiles to native code. Note that the
repl has to get bootstrapped every time right now, it might take a 
couple of seconds, since all of `clojure.core` has to be compiled on
each startup.

## Build

The toolchain currently works on Ubuntu and OS X. Make sure that LLVM 18.0+ is
installed from either the llvm debian repository or via homebrew on OS X.

Then clone this reposity with the *--recursive* flag. 

    git clone --recursive -b develop git@github.com:torque-project/torque.git
    
This will clone all dependencies of this project. Next, we need to build the
libffi version in lib/rev/lib/libffi. This is required since the version in
homebrew and the ubuntu repository is outdated. Install libffi to an appropriate
location like /usr/local.

Next, we need to set some environment variables for the build, and later running
a repl.

    . ./activate

On platforms, other than Mac, with homebrew, you need to provide the path to
the LLVM installation, if this isn't simply installed in the search path.

    export LLVM_PATH=/opt/llvm/18.0.0/

After that simply run make in the project root. Once this is done you should
source the *activate* script found in the project root. Now, simply run the
repl script in the bin folder.

    bin/repl
    
This will bootstrap the compiler and start a LLVM compiled REPL. The repl currently
doesn't cache the result of the bootstrapping process, so the REPL start time is 
currently a couple of seconds long on each run.

## Sub Projects

The code base is split up into several sub projects, providing the core libraries, I/O,
and compiler infrastructure.

* https://github.com/torque-project/torque.core
* https://github.com/torque-project/torque.reader
* https://github.com/torque-project/torque.analyzer
* https://github.com/torque-project/torque.compiler
* https://github.com/torque-project/torque.io

## Current Objectives

I'm currently in the process of updating this project. The original version didn't feature
garbage collection, since I wanted to write a sytem that doesn't rely on this. Rusts borrow 
system provides a nice alternative. There are also other optimizations, and a clean up that
are necessary.
