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
is available currently takes less than 10 second.

Besides this purely "for fun" goal, the theory behind the project was that a single 
compiler that targets different back ends would have worked better than Clojure's
current approach, of hosting the language of different platforms. Especially 
considering the possibility to target web assembly, or GPUs using LLVM, makes using
LLVM attractive. Clojure's initial goal to support the JVM as a host platform could
have easily been supported by hosting a JVM within a compiled process, even though the 
actual merits of that seem thin to me.

## Build

The toolchain currently works on Ubuntu and OS X. Make sure that LLVM 7.0+ is
installed from either the llvm debian repository or via homebrew on OS X.

Then clone this reposity with the *--recursive* flag. 

    git clone --recursive -b develop git@github.com:torque-project/torque.git
    
This will clone all dependencies of this project. Next, we need to build the
libffi version in lib/rev/lib/libffi. This is required since the version in
homebrew and the ubuntu repository is outdated. Install libffi to an appropriate
location like /usr/local.

After that simply run make in the project root. Once this is done you should
source the *activate* script found in the project root. Now, simply run the
repl script in the bin folder.

    . ./activate
    bin/repl
    
This will bootstrap the compiler and start a LLVM compiled REPL. The repl currently
doesn't cache the result of the bootstrapping process, so the REPL start time is 
currently a couple of seconds long on each run.

## Current Work

I'm currently in the process of updating this project. The original version didn't feature
garbage collection, since I wanted to write a sytem that doesn't rely on this. Rusts borrow 
system provides a nice alternative. There are also other optimizations, and a clean up that
are necessary.
