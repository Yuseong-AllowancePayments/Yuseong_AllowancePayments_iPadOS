import UIKit

public extension UIColor.Colors {
    enum GrayScale: Colorable {
        case g05
        case g10
        case g20
        case g30
        case g40
        case g50
        case g60
        case g70
        case g80
        case g90
    }
}

public extension UIColor.Colors.GrayScale {
    var color: UIColor {
        switch self {
        case .g05: return DesignSystemAsset.GrayScale.gray50.color
        case .g10: return DesignSystemAsset.GrayScale.gray100.color
        case .g20: return DesignSystemAsset.GrayScale.gray200.color
        case .g30: return DesignSystemAsset.GrayScale.gray300.color
        case .g40: return DesignSystemAsset.GrayScale.gray400.color
        case .g50: return DesignSystemAsset.GrayScale.gray500.color
        case .g60: return DesignSystemAsset.GrayScale.gray600.color
        case .g70: return DesignSystemAsset.GrayScale.gray700.color
        case .g80: return DesignSystemAsset.GrayScale.gray800.color
        case .g90: return DesignSystemAsset.GrayScale.gray900.color
        }
    }
}
