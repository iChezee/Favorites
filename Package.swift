// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Favourites",
    products: [
        .library(name: "Favourites", targets: ["Favourites"])
    ],
    targets: [
        .target(name: "Favourites"),
        .testTarget(name: "FavouritesTests", dependencies: ["Favourites"])
    ]
)
