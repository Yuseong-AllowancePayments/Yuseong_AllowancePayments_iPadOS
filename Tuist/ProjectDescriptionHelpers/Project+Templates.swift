import ConfigurationPlugin
import DependencyPlugin
import EnvironmentPlugin
import Foundation
import ProjectDescription

let isCI = (ProcessInfo.processInfo.environment["TUIST_CI"] ?? "0") == "1" ? true : false

public enum MicroFeatureTarget {
    case interface
    case testing
    case unitTest
    case uiTest
    case demo
}

public extension Project {
    static func makeModule(
        name: String,
        platform: Platform = env.platform,
        product: Product,
        targets: Set<MicroFeatureTarget>,
        packages: [Package] = [],
        deploymentTarget: DeploymentTarget? = env.deploymentTarget,
        externalDependencies: [TargetDependency] = [],
        internalDependencies: [TargetDependency] = [],
        unitTestDependencies: [TargetDependency] = [],
        uiTestDependencies: [TargetDependency] = [],
        demoDependencies: [TargetDependency] = [],
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

        var testTargetDependencies = [
            targets.contains(.demo) ?
            TargetDependency.target(name: "\(name)DemoApp") :
                TargetDependency.target(name: name)
        ]
        
        // MARK: - Unit Test
        if targets.contains(.unitTest) {
            allTargets.append(
                Target(
                    name: "\(name)Tests",
                    platform: platform,
                    product: .unitTests,
                    bundleId: "\(env.organizationName).\(name)Tests",
                    deploymentTarget: deploymentTarget,
                    infoPlist: .default,
                    sources: .unitTests,
                    scripts: scripts,
                    dependencies: testTargetDependencies + unitTestDependencies
                )
            )
        }

        // MARK: - UI Test
        if targets.contains(.uiTest) {
            allTargets.append(
                Target(
                    name: "\(name)UITests",
                    platform: platform,
                    product: .uiTests,
                    bundleId: "\(env.organizationName).\(name)UITests",
                    deploymentTarget: deploymentTarget,
                    infoPlist: .default,
                    scripts: scripts,
                    dependencies: testTargetDependencies + uiTestDependencies
                )
            )
        }

        // MARK: - Demo App
        if targets.contains(.demo) {
            var demoDependencies = demoDependencies
            demoDependencies.append(.target(name: name))
            if targets.contains(.testing) {
                demoDependencies.append(.target(name: "\(name)Testing"))
            }
            allTargets.append(
                Target(
                    name: "\(name)DemoApp",
                    platform: platform,
                    product: .app,
                    bundleId: "\(env.organizationName).\(name)DemoApp",
                    deploymentTarget: deploymentTarget,
                    infoPlist: .extendingDefault(with: [
                        "UIMainStoryboardFile": "",
                        "UILaunchStoryboardName": "LaunchScreen",
                        "ENABLE_TESTS": .boolean(true),
                    ]),
                    sources: .demoSources,
                    resources: ["Demo/Resources/**"],
                    scripts: scripts,
                    dependencies: demoDependencies
                )
            )
        }

        let schemes: [Scheme] = targets.contains(.demo) ?
        [.makeScheme(target: .dev, name: name), .makeDemoScheme(target: .dev, name: name)] :
        [.makeScheme(target: .dev, name: name)]

        return Project(
            name: name,
            organizationName: env.organizationName,
            packages: packages,
            settings: settings,
            targets: allTargets,
            schemes: schemes
        )
    }
}

extension Scheme {
    static func makeScheme(target: ConfigurationName, name: String) -> Scheme {
        return Scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
    static func makeDemoScheme(target: ConfigurationName, name: String) -> Scheme {
        return Scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)DemoApp"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(coverage: true, codeCoverageTargets: ["\(name)DemoApp"])
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
}
