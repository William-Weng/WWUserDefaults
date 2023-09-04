// swift-tools-version: 5.7
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
        .package(url: "https://github.com/William-Weng/WWPrint.git", from: "1.2.0"),
    ],
    targets: [
        .target(name: "WWUserDefaults", dependencies: ["WWPrint"]),
    ]
)
