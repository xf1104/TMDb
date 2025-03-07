// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

import class Foundation.ProcessInfo

let package = Package(
    name: "TMDb",

    defaultLocalization: "en",

    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .watchOS(.v9),
        .tvOS(.v16),
        .visionOS(.v1)
    ],

    products: [
        .library(name: "TMDb", targets: ["TMDb"])
    ],

    targets: [
        .target(
            name: "TMDb"
        ),
        .testTarget(
            name: "TMDbTests",
            dependencies: ["TMDb"],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "TMDbIntegrationTests",
            dependencies: ["TMDb"]
        )
    ]
)

if ProcessInfo.processInfo.environment["SWIFTCI_DOCC"] == "1" {
    package.dependencies += [
        .package(url: "https://github.com/apple/swift-docc-plugin.git", from: "1.4.3")
    ]
}
