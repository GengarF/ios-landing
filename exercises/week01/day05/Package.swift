// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Day05PropertyObserverComputedExtension",
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "Day05PropertyObserverComputedExtension"
        ),
        .testTarget(
            name: "Day05PropertyObserverComputedExtensionTests",
            dependencies: ["Day05PropertyObserverComputedExtension"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
