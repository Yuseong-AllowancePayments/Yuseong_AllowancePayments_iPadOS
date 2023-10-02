import UIKit

public extension UIColor.Colors {
    enum Primary: Colorable {
        case primary
        case hover
        case background
    }
}

public extension UIColor.Colors.Primary {
    var color: UIColor {
        switch self {
        case .primary: return DesignSystemAsset.PrimaryColor.primary.color
        case .hover: return DesignSystemAsset.PrimaryColor.primaryHover.color
        case .background: return DesignSystemAsset.PrimaryColor.primaryBackground.color
        }
    }
}
