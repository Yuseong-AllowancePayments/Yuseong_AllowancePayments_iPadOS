import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension Package {
    static let RealmSwift = Package.remote(
        url: "https://github.com/realm/realm-swift.git",
        requirement: .upToNextMajor(from: "10.36.0")
    )
}

public extension TargetDependency.SPM {
    static let RxSwift = TargetDependency.external(name: "RxSwift")
    static let RxCocoa = TargetDependency.external(name: "RxCocoa")
    static let RxFlow = TargetDependency.external(name: "RxFlow")
    static let SnapKit = TargetDependency.external(name: "SnapKit")
    static let Then = TargetDependency.external(name: "Then")
    static let Swinject = TargetDependency.external(name: "Swinject")
    static let RealmSwift = TargetDependency.package(product: "RealmSwift")
}
