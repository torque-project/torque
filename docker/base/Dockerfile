FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y build-essential pkg-config libffi-dev libreadline-dev clang-3.8 clang cmake git
RUN mkdir -p /build-llvm/build
RUN cd /build-llvm && git clone -b testing https://github.com/llvm-mirror/llvm
RUN cd /build-llvm/build && cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -DLLVM_BUILD_LLVM_DYLIB=1 -DLLVM_TARGETS_TO_BUILD="X86" ../llvm
RUN cd /build-llvm/build && make && make install
