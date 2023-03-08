// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Module",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Module",
            targets: ["Module"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "DesignSystem", path: "../DesignSystem"),
        .package(name: "Domain", path: "../Domain"),
        .package(url: "https://github.com/hmlongco/Factory.git", from: "1.0.0"),
        .package(name: "Redux", path: "../Redux"),
        .package(name: "Utilities", path: "../Utilities"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Module",
            dependencies: [
                "DesignSystem",
                "Domain",
                "Factory",
                "Redux",
                "Utilities",
            ]),
        .testTarget(
            name: "ModuleTests",
            dependencies: ["Module"]),
    ]
)
