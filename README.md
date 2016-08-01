# torque

The torque project CLI toolchain

The tourque project is an LLVM based clojure compiler. This repository is the
main entry point to clone and build the project.

## Build

The toolchain currently works on Ubuntu and OS X. Make sure that LLVM 4.0 is
installed from either the llvm debian repository or via homebrew on OS X.

Then clone this reposity with the *--revusrive* flag. 

    git clone --resurive -b develop git@github.com:torque-project/torque.git
    
This will clone all dependencies of this project. Next, we need to build the
libffi version in lib/rev/lib/libffi. This is required since the version in
homebrew and the ubuntu repository is outdated.

After that simply run make in the project root. Once this is done you should
source the *activate* script found in the project root. Now, simply run the
repl script in the bin folder.

    . ./activate
    bin/repl
    
This will bootstrap the compiler and start a LLVM compiled REPL. The repl currently
doesn't cache the result of the bootstrapping process, so the REPL start time is 
currently a couple of seconds long on each run.

## Prebuilt Images (TODO)

You can obtain prebuilt images with all development dependencies and a prebuilt
version of the toolchain here:

* N/A
* ...
