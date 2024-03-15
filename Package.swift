// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWUserDefaults",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "WWUserDefaults", targets: ["WWUserDefaults"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "WWUserDefaults", resources: [.copy("Privacy")]),
    ]
)
