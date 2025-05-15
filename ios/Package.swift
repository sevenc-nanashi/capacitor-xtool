// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "main",
    defaultLocalization: "ja",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // An xtool project should contain exactly one library target,
        // representing the main app.
        .library(
            name: "main",
            targets: ["main"]
        )
    ],
    dependencies: [
        .package(name: "CapApp-SPM", path: "./App/CapApp-SPM")
    ],
    targets: [
        .target(
            name: "main",
            dependencies: [
                .product(name: "CapApp-SPM", package: "CapApp-SPM")
            ],
            path: "./App/App",
            resources: [
                .copy("./public"),
                .process("./capacitor.config.json"),
                .process("./Assets.xcassets"),
            ]
        )
    ]
)
