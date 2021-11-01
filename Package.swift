// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

func czeroMQPackage() -> Target {
    if #available(macOS 10.15, *) {
        return .systemLibrary(name: "CZeroMQ", pkgConfig: "libzmq")
    } else {
        return .systemLibrary(name: "CZeroMQ", path: "../lib", pkgConfig: "libzmq")
    }
}

let package = Package(
    name: "CZeroMQ",
    products: [
        .library(name: "CZeroMQ", targets: ["CZeroMQ"]),
    ],
    targets: [
//        .target(name: "SwiftZeroMQ",
//                dependencies: ["CZeroMQ"]
//               ),
        czeroMQPackage()
    ]
)
