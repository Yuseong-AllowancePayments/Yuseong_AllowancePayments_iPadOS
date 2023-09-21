import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let RxSwift = TargetDependency.external(name: "RxSwift")
    static let RxFlow = TargetDependency.external(name: "RxFlow")
    static let RxCocoa = TargetDependency.external(name: "RxCocoa")
    static let Then = TargetDependency.external(name: "Then")
    static let Swinject = TargetDependency.package(product: "Swinject")
    static let SnapKit = TargetDependency.package(product: "SnapKit")
}
