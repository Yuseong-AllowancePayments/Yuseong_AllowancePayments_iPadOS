import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "BaseFeature",
    product: .framework,
    targets: [.unitTest],
    externalDependencies: [
        .Shared.DesignSystem,
        .SPM.RxSwift,
        .SPM.RxCocoa,
        .SPM.RxFlow,
        .SPM.SnapKit,
        .SPM.Then,
        .SPM.Swinject
    ]
)
