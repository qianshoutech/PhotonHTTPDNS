// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PhotonHTTPDNS",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "PhotonHTTPDNS",
            targets: ["_PhotonHTTPDNS"])
    ],
    targets: [
        .target(
            name: "_PhotonHTTPDNS",
            dependencies: [
                "PhotonHTTPDNS"
            ],
            resources: [
                .process("PhotonDNSSource.bundle")
            ],
            cxxSettings: [
                .define("NS_BLOCK_ASSERTIONS", to: "1", .when(configuration: .release))
            ],
            linkerSettings: [
                .linkedFramework("Foundation"),
                .linkedLibrary("c++"),
                .linkedLibrary("stdc++"),
                .linkedLibrary("resolv")
            ]
        ),
        .binaryTarget(
            name: "PhotonHTTPDNS",
            url: "https://github.com/qianshoutech/PhotonHTTPDNS/releases/download/1.0.8-openssl-1.1.1c/PhotonHTTPDNS.xcframework.zip",
            checksum: "f082c5bb22c96e0ccf0c7c6046e3006ee9e49e06dced9500d932d047e3284bec"
        )
    ]
)
