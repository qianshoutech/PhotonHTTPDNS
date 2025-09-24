// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// 实际版本 1.0.8-openssl-1.1.1c
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
// SPM 最终会将此 bundle 重命名为 PhotonHTTPDNS__PhotonHTTPDNS.bundle, 但framework会以PhotonDNSSource.bundle来获取资源
// 原框架不规范, 由于没有源码, 需要将此 bundle 单独引入到主 target, 这样 product 产物中才是"正确"的 bundle 名
//            resources: [
//                .process("PhotonDNSSource.bundle")
//            ],
            exclude: [
                "PhotonDNSSource.bundle"
            ],
            cSettings: [
                .define("NS_BLOCK_ASSERTIONS", to: "1", .when(configuration: .release))
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
            url: "https://github.com/qianshoutech/PhotonHTTPDNS/releases/download/1.0.8-openssl-1.1.1d/PhotonHTTPDNS.xcframework.zip",
            checksum: "f082c5bb22c96e0ccf0c7c6046e3006ee9e49e06dced9500d932d047e3284bec"
        )
    ]
)
