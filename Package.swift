// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// 实际版本 1.0.8-openssl-1.1.1c
let package = Package(
    name: "PhotonHTTPDNS",
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
            url: "https://github.com/qianshoutech/PhotonHTTPDNS/releases/download/1.0.10/PhotonHTTPDNS.xcframework.zip",
            checksum: "0c4eb903f26fe1a7f54b9d26786f357fe5c0d727ece5c429d3b8e9966741dd83"
        )
    ]
)
