// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// swiftlint:disable:next prefixed_toplevel_constant
let package = Package(
    name: "BlueprintModels",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "BlueprintModels",
            targets: ["BlueprintModels"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.30.0")
    ],
    targets: [
        .target(
            name: "BlueprintModels",
            dependencies: [
                .product(name: "SwiftProtobuf", package: "swift-protobuf")
            ]
        )
    ],
    swiftLanguageModes: [.v5]
)
