import ProjectDescription
import ConfigurationPlugin

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager:
        SwiftPackageManagerDependencies(
            [
                .remote(url: "https://github.com/Quick/Quick.git", requirement: .upToNextMajor(from: "5.0.1")),
                .remote(url: "https://github.com/Quick/Nimble.git", requirement: .upToNextMajor(from: "10.0.0")),
                .remote(url: "https://github.com/SnapKit/SnapKit.git", requirement: .upToNextMajor(from: "5.0.0")),
                .remote(url: "https://github.com/devxoul/Then.git", requirement: .upToNextMajor(from: "3.0.0")),
                .remote(url: "https://github.com/realm/realm-swift.git", requirement: .upToNextMajor(from: "10.42.3"))
            ],
            baseSettings: .settings(
                configurations: [
                    .debug(name: .dev),
                    .debug(name: .stage),
                    .release(name: .prod)
                ]
            )
        ),
    platforms: [.iOS]
)
