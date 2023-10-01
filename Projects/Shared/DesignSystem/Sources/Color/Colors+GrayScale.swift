import UIKit

public extension UIColor.Colors {
    enum GrayScale: Colorable {
        case p05
        case p10
        case p20
        case p30
        case p40
        case p50
        case p60
        case p70
        case p80
        case p90
    }
}

public extension UIColor.Colors.GrayScale {
    var color: UIColor {
        switch self {
        case .p05: return DesignSystemAsset.GrayScale.gray50.color
        case .p10: return DesignSystemAsset.GrayScale.gray100.color
        case .p20: return DesignSystemAsset.GrayScale.gray200.color
        case .p30: return DesignSystemAsset.GrayScale.gray300.color
        case .p40: return DesignSystemAsset.GrayScale.gray400.color
        case .p50: return DesignSystemAsset.GrayScale.gray500.color
        case .p60: return DesignSystemAsset.GrayScale.gray600.color
        case .p70: return DesignSystemAsset.GrayScale.gray700.color
        case .p80: return DesignSystemAsset.GrayScale.gray800.color
        case .p90: return DesignSystemAsset.GrayScale.gray900.color
        }
    }
}
