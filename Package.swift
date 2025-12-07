// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// Local validation build (dnn removed)
let binaryURL = "https://github.com/erichchampion/opencv/releases/download/opencv-local/opencv2-local-flat.zip"
let checksum = "ba65551e27021205582aa70a792ca323c453fbfd742605457f5339a8a582cb53"

let package = Package(
    name: "OpenCV",
    platforms: [
        .macOS(.v10_13), .iOS(.v12), .macCatalyst(.v13), .visionOS(.v1)
    ],
    products: [
        .library(
            name: "OpenCV",
            targets: ["opencv2", "opencv2-dependencies"]),
    ],
    targets: [
        .binaryTarget(
            name: "opencv2",
            url: binaryURL,
            checksum: checksum
        ),
        .target(
            name: "opencv2-dependencies",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreImage"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreVideo", .when(platforms: [.iOS, .visionOS])),
                .linkedFramework("Accelerate", .when(platforms: [.iOS, .macOS, .visionOS])),
                .linkedFramework("OpenCL", .when(platforms: [.macOS])),
                .linkedLibrary("c++")
            ]
        )
    ]
)
