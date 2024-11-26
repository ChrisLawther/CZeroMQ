// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

func libzmq() -> Target {
    if #available(macOS 10.15, *) {
        return .systemLibrary(name: "libzmq", pkgConfig: "libzmq")
    } else {
        return .binaryTarget(name: "libzmq", path: "libzmq.xcframework")
    }
}

let package = Package(
    name: "CZeroMQ",
    products: [
        .library(name: "CZeroMQ", targets: ["libzmq"]),
    ],
    targets: [
        libzmq()
    ]
)
