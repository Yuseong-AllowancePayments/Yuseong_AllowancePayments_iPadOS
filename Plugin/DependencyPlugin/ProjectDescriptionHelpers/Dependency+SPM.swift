import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let Quick = TargetDependency.external(name: "Quick")
    static let Nimble = TargetDependency.external(name: "Nimble")
    static let Realm = TargetDependency.external(name: "Realm")
    static let Needle = TargetDependency.external(name: "NeedleFoundation")
}
