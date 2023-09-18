import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "ManageFeature",
    product: .staticLibrary,
    targets: [.unitTest],
    internalDependencies: [
        .Feature.BaseFeature
    ]
)
