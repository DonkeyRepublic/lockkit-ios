// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "DonkeyLockKit",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "DonkeyLockKit",
            targets: ["DonkeyLockKit", "LinkaAPIKit"]
        )
    ],
    targets: [
        .binaryTarget(name: "DonkeyLockKit", path: "DonkeyLockKit.xcframework"),
        .binaryTarget(name: "LinkaAPIKit", path: "LinkaAPIKit.xcframework")
    ]
)
