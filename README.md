# CZeroMQ

A SPM system library of ZMQ, suitable for such things as importing into a Swift-y wrapper.

For use on macOS / Linux, the library installed on the system will be used.

For use on iOS (device or simulator), a locally built (cross-compiled) library is needed. The included `Build` script generates such a library, which must then be manually linked into your project.


# libzmq

A Universal (`x86_64`, `arm64e` and `arm64`) bit-code enabled build of `libzmq` for iOS, with `libsodium` statically linked.

## Prerequisites

Install both `autoconf` and `automake`:

    brew install autoconf automake

## Building

Confirm / modify the `libzmq` and `libsodium` version numbers near the top of `./Build`, then simply run the script:

    ./Build

The end result should be a new directory with the structure:

    universal
      +- include
      |    +- zmq_utils.h
      |    +- zmq.h
      +- lib
           +- libzmq.a

Where `libzmq.a` reports:

    $ file universal/lib/libzmq.a
    universal/lib/libzmq.a: Mach-O universal binary with 3 architectures: [x86_64:current ar archive] [arm64] [arm64e]
    universal/lib/libzmq.a (for architecture x86_64):    current ar archive
    universal/lib/libzmq.a (for architecture arm64):    current ar archive
    universal/lib/libzmq.a (for architecture arm64e):    current ar archive

# Appendix

## Text from original script

This is a script that downloads and builds libzmq for iOS, including libsodium support, including arm64 support.

Compile

Note: Make sure that you not have any space in path. Else these scripts will not work.

1. Download libzmq-ios as zip
2. Download libsodium-ios as zip
3. copy ./libsodium/ to ./libzmq-ios-master/libsodium-ios/
4. copy ./libsodium.sh to ./libzmq-ios-master/libsodium-ios/
5. run ./libzmq.sh
6. Wait until it's done
7. Should gives you ./libzmq_dist/include/*.h and lib/libzmq.a

At least it get's compiled.

1. Clone specific libzmq version, e.g.:

    version=v4.3.3
    git clone --depth 1 --branch $version https://github.com/zeromq/libzmq.git libzmq
    or
    curl -O -L https://github.com/zeromq/libzmq/archive/${version}.tar.gz
