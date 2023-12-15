// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Checkpoints",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "Checkpoints",
            targets: ["Checkpoints"]),
    ],
    dependencies: [
        .package(url: "https://github.com/horizontalsystems/HsExtensions.Swift.git", .upToNextMajor(from: "2.0.0")),
    ],
    targets: [
        .target(
            name: "Checkpoints",
            dependencies: [
                .product(name: "HsExtensions", package: "HsExtensions.Swift"),
            ],
            resources: [
                .copy("Assets")
            ]),
        .testTarget(
            name: "CheckpointTests",
            dependencies: [
                "Checkpoints",
                .product(name: "HsExtensions", package: "HsExtensions.Swift"),
            ]),
    ]
)
