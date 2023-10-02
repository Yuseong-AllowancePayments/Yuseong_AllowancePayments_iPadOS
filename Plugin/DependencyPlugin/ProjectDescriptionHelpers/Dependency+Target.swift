import ProjectDescription

// swiftlint: disable all
public extension TargetDependency {
    struct Shared {}
}

public extension TargetDependency.Shared {
    static let DesignSystem = TargetDependency.project(
        target: ModulePaths.Shared.DesignSystem.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.DesignSystem.rawValue)
    )
}
