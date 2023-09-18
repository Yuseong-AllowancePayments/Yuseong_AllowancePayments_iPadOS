import ProjectDescriptionHelpers
import ProjectDescription
import DependencyPlugin
import EnvironmentPlugin
import Foundation

let isCI = (ProcessInfo.processInfo.environment["TUIST_CI"] ?? "0") == "1" ? true : false

let configurations: [Configuration] = [
    .debug(name: .dev, xcconfig: isCI ? nil : .relativeToXCConfig(type: .dev, name: env.targetName)),
    .debug(name: .stage, xcconfig: isCI ? nil : .relativeToXCConfig(type: .stage, name: env.targetName)),
    .release(name: .prod, xcconfig: isCI ? nil : .relativeToXCConfig(type: .prod, name: env.targetName))
  ]

let settings: Settings =
    .settings(base: env.baseSetting,
              configurations: configurations,
              defaultSettings: .recommended)

let scripts: [TargetScript] = isCI ? [] : [.swiftLint, .needle]

let targets: [Target] = [
    .init(
        name: env.targetName,
        platform: .iOS,
        product: .app,
        productName: env.appName,
        bundleId: "\(env.organizationName)",
        deploymentTarget: env.deploymentTarget,
        infoPlist: .file(path: "Support/Info.plist"),
        sources: ["Sources/**"],
        resources: ["Resources/**"],
        scripts: scripts,
        dependencies: [
            .Feature.BaseFeature,
            .Feature.ApplyFeature,
            .Feature.ManageFeature,
            .Domain.LocalDomain,
            .SPM.Needle
        ],
        settings: .settings(base: env.baseSetting)
    )
]

let schemes: [Scheme] = [
    .init(
      name: "\(env.targetName)-DEV",
      shared: true,
      buildAction: .buildAction(targets: ["\(env.targetName)"]),
      testAction: TestAction.targets(
          ["\(env.targetTestName)"],
          configuration: .dev,
          options: TestActionOptions.options(
              coverage: true,
              codeCoverageTargets: ["\(env.targetName)"]
          )
      ),
      runAction: .runAction(configuration: .dev),
      archiveAction: .archiveAction(configuration: .dev),
      profileAction: .profileAction(configuration: .dev),
      analyzeAction: .analyzeAction(configuration: .dev)
    ),
    .init(
      name: "\(env.targetName)-PROD",
      shared: true,
      buildAction: BuildAction(targets: ["\(env.targetName)"]),
      testAction: nil,
      runAction: .runAction(configuration: .prod),
      archiveAction: .archiveAction(configuration: .prod),
      profileAction: .profileAction(configuration: .prod),
      analyzeAction: .analyzeAction(configuration: .prod)
    ),
    .init(
      name: "\(env.targetName)-STAGE",
      shared: true,
      buildAction: BuildAction(targets: ["\(env.targetName)"]),
      testAction: nil,
      runAction: .runAction(configuration: .stage),
      archiveAction: .archiveAction(configuration: .stage),
      profileAction: .profileAction(configuration: .stage),
      analyzeAction: .analyzeAction(configuration: .stage)
    )
]

let project: Project =
    .init(
        name: env.targetName,
        organizationName: env.organizationName,
        settings: settings,
        targets: targets,
        schemes: schemes
    )
