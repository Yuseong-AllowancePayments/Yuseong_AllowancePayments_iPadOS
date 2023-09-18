import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "ApplyFeature",
    product: .staticLibrary,
    targets: [.unitTest],
    internalDependencies: [
        .Feature.BaseFeature
    ]
)
