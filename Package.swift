// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "CombineRPG",
    platforms: [.iOS(.v13),.macOS(.v10_15)],
    products: [
        .library(
            name: "CombineRPG",
            targets: ["CombineRPG"]),
    ],
    targets: [
        .target(
            name: "CombineRPG",
            dependencies: []),
        .testTarget(
            name: "CombineRPGTests",
            dependencies: ["CombineRPG"]),
    ]
)
