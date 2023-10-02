import Foundation

// swiftlint: disable all
public enum ModulePaths {
    case shared(Shared)
}

public extension ModulePaths {
    enum Shared: String {
        case DesignSystem
        
        func targetName(type: TargetType) -> String {
            "\(self.rawValue)\(type.rawValue)"
        }
    }
}

public enum TargetType: String {
    case sources = ""
}
