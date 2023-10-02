import ConfigurationPlugin
import DependencyPlugin
import EnvironmentPlugin
import Foundation
import ProjectDescription

let isCI = (ProcessInfo.processInfo.environment["TUIST_CI"] ?? "0") == "1" ? true : false

public extension Project {
    static func makeModule(
        name: String,
        platform: Platform = env.platform,
        product: Product,
        packages: [Package] = [],
        deploymentTarget: DeploymentTarget? = env.deploymentTarget,
        externalDependencies: [TargetDependency] = [],
        internalDependencies: [TargetDependency] = [],
        sources: SourceFilesList = .sources,
        resources: ResourceFileElements? = nil,
        settings: SettingsDictionary = [:],
        additionalPlistRows: [String: ProjectDescription.InfoPlist.Value] = [:],
        additionalFiles: [FileElement] = []
    ) -> Project {
        let scripts: [TargetScript] = isCI ? [] : [.swiftLint]
        let ldFlagsSettings: SettingsDictionary = product == .framework ?
        ["OTHER_LDFLAGS": .string("$(inherited) -all_load")] :
        ["OTHER_LDFLAGS": .string("$(inherited)")]

        let configurations: [Configuration] = isCI ?
        [
          .debug(name: .dev),
          .debug(name: .stage),
          .release(name: .prod)
        ] :
        [
          .debug(name: .dev, xcconfig: .relativeToXCConfig(type: .dev, name: name)),
          .debug(name: .stage, xcconfig: .relativeToXCConfig(type: .stage, name: name)),
          .release(name: .prod, xcconfig: .relativeToXCConfig(type: .prod, name: name))
        ]

        let settings: Settings = .settings(
            base: env.baseSetting
                .merging(settings)
                .merging(ldFlagsSettings),
            configurations: configurations,
            defaultSettings: .recommended
        )
        var allTargets: [Target] = []
        var dependencies = internalDependencies + externalDependencies

        // MARK: - Sources
        allTargets.append(
            Target(
                name: name,
                platform: platform,
                product: product,
                bundleId: "\(env.organizationName).\(name)",
                deploymentTarget: deploymentTarget,
                infoPlist: .extendingDefault(with: additionalPlistRows),
                sources: sources,
                resources: resources,
                scripts: scripts,
                dependencies: dependencies
            )
        )

        return Project(
            name: name,
            organizationName: env.organizationName,
            packages: packages,
            settings: settings,
            targets: allTargets
        )
    }
}
