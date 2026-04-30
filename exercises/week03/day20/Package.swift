// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Day20ValueReferenceDeepDive",
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "Day20ValueReferenceDeepDive"
        ),
        .testTarget(
            name: "Day20ValueReferenceDeepDiveTests",
            dependencies: ["Day20ValueReferenceDeepDive"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
