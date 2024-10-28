// swift-tools-version:5.9

import PackageDescription

let package = Package(
  name: "AutoLayout",
  platforms: [
    .iOS(.v13)
  ],
  products: [
    .library(
      name: "AutoLayout",
      targets: ["AutoLayout"]
    )
  ],
  targets: [
    .target(
      name: "AutoLayout"
    )
  ]
)
