// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Day21StudentGradeManager",
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "Day21StudentGradeManager"
        ),
        .testTarget(
            name: "Day21StudentGradeManagerTests",
            dependencies: ["Day21StudentGradeManager"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
