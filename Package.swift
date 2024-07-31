// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapacitorPluginSocket",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CapacitorPluginSocket",
            targets: ["TcpPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "TcpPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/TcpPlugin"),
        .testTarget(
            name: "TcpPluginTests",
            dependencies: ["TcpPlugin"],
            path: "ios/Tests/TcpPluginTests")
    ]
)