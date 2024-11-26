// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CZeroMQ",
    products: [
        .library(name: "CZeroMQ", targets: ["CZeroMQ"]),
    ],
    targets: [
        .binaryTarget(name: "CZeroMQ", path: "libzmq.xcframework")
    ]
)
