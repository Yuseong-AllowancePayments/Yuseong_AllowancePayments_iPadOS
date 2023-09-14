import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Domain.LocalDomain.rawValue,
    product: .framework,
    targets: [.unitTest],
    internalDependencies: [
        .Core.Keychain
    ],
    additionalPlistRows: [
        "BASE_URL": .string("$(BASE_URL)")
    ]
)