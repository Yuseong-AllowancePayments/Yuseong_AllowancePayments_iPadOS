import ProjectDescription
import ConfigurationPlugin

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager:
        SwiftPackageManagerDependencies(
            [
                .remote(
                    url: "https://github.com/ReactiveX/RxSwift",
                    requirement: .upToNextMajor(from: "6.6.0")
                ),
                .remote(
                    url: "https://github.com/RxSwiftCommunity/RxFlow.git",
                    requirement: .upToNextMajor(from: "2.13.0")
                ),
                .remote(
                    url: "https://github.com/realm/realm-swift.git",
                    requirement: .upToNextMajor(from: "10.42.3")
                ),
                .remote(
                    url: "https://github.com/devxoul/Then.git",
                    requirement: .upToNextMajor(from: "3.0.0")
                ),
                .remote(
                    url: "https://github.com/Swinject/Swinject.git",
                    requirement: .upToNextMajor(from: "2.8.3")
                ),
                .remote(
                    url: "https://github.com/SnapKit/SnapKit.git",
                    requirement: .upToNextMajor(from: "5.6.0")
                )
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
