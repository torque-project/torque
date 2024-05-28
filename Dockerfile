FROM alpine:3.20.0 AS build

RUN apk update
RUN apk add --no-cache build-base gcc g++ libc-dev clang18 clang18-headers libstdc++ libstdc++-dev libffi-dev llvm18 llvm18-dev pkgconf readline-dev

# setup symbolic links to versioned binaries, and libraries.
RUN ln -s /usr/bin/clang-18 /usr/bin/clang
RUN ln -s /usr/bin/clang++-18 /usr/bin/clang++
RUN ln -s /usr/lib/libLLVM-18.so /usr/lib/libLLVM.so

WORKDIR /torque
COPY . .

RUN LLVM_PATH="/usr/lib/llvm18" make -j$(nproc --all)

FROM alpine:3.20.0

RUN apk update
RUN apk add --no-cache libstdc++ libffi llvm18 llvm18-libs readline zsh

RUN ln -s /usr/lib/libLLVM-18.so /usr/lib/libLLVM.so
RUN ln -s /usr/lib/libreadline.so.8 /usr/lib/libreadline.so

RUN echo "cd /torque && source /torque/activate" >> ~/.zshrc

COPY --from=build ./torque ./torque

ENTRYPOINT [ "/bin/zsh" ]
