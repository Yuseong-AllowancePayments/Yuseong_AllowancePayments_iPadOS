import ProjectDescription

// swiftlint: disable all
public extension TargetDependency {
    struct Feature {}
    struct Domain {}
    struct Core {}
    struct Shared {}
}

public extension TargetDependency.Feature {
    static let BaseFeature = TargetDependency.project(
        target: ModulePaths.Feature.BaseFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.BaseFeature.rawValue)
    )
}

public extension TargetDependency.Domain {
    static let LocalDomain = TargetDependency.project(
        target: ModulePaths.Domain.LocalDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.LocalDomain.rawValue)
    )
}

public extension TargetDependency.Core {
    static let Keychain = TargetDependency.project(
        target: ModulePaths.Core.Keychain.targetName(type: .sources),
        path: .relativeToCore(ModulePaths.Core.Keychain.rawValue)
    )
}

public extension TargetDependency.Shared {
    static let DesignSystem = TargetDependency.project(
        target: ModulePaths.Shared.DesignSystem.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.DesignSystem.rawValue)
    )
}
