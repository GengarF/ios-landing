// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Day03EnumMethodMutating",
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "Day03EnumMethodMutating"
        ),
        .testTarget(
            name: "Day03EnumMethodMutatingTests",
            dependencies: ["Day03EnumMethodMutating"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
