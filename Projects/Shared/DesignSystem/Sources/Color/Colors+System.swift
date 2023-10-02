import UIKit

public extension UIColor.Colors {
    enum System: Colorable {
        case green
        case red
        case white
    }
}

public extension UIColor.Colors.System {
    var color: UIColor {
        switch self {
        case .green: return DesignSystemAsset.SystemColor.green.color
        case .red: return DesignSystemAsset.SystemColor.red.color
        case .white: return DesignSystemAsset.SystemColor.white.color
        }
    }
}
