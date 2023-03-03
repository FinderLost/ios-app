// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Data",
            targets: ["Data"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "Domain", path: "../Domain"),
        .package(url: "git@github.com:hmlongco/Factory.git", from: "1.0.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "9.0.0"),
        .package(url: "https://github.com/google/GoogleSignIn-iOS", from: "7.0.0"),
        .package(name: "Utilities", path: "../Utilities"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Data",
            dependencies: [
                "Domain",
                "Factory",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseFirestoreCombine-Community", package: "firebase-ios-sdk"),
                .product(name: "FirebaseFirestoreSwift", package: "firebase-ios-sdk"),
                .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS"),
                "Utilities",
            ]),
        .testTarget(
            name: "DataTests",
            dependencies: ["Data"]),
    ]
)
