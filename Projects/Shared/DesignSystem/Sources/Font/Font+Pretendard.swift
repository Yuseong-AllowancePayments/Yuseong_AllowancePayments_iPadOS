import UIKit

public extension UIFont {
    enum FontSystem: Fontable {
        case d1
        case d2
        case d3
        case h1
        case h2
        case h3
        case h4
        case h5
        case p1
        case p2
        case p3
        case button1
        case button2
        case button3
        case context
        case caption
        case code
    }

    static func dotori(_ style: FontSystem) -> UIFont {
        return style.font
    }
}

public extension UIFont.FontSystem {
    var font: UIFont {
        switch self {
        case .d1:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 72) ?? .init()
        case .d2:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 60) ?? .init()
        case .d3:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 48) ?? .init()
        case .h1:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 36) ?? .init()
        case .h2:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 28) ?? .init()
        case .h3:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 24) ?? .init()
        case .h4:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 20) ?? .init()
        case .h5:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 18) ?? .init()
        case .p1:
            return UIFont(font: DesignSystemFontFamily.Pretendard.regular, size: 18) ?? .init()
        case .p2:
            return UIFont(font: DesignSystemFontFamily.Pretendard.regular, size: 16) ?? .init()
        case .p3:
            return UIFont(font: DesignSystemFontFamily.Pretendard.regular, size: 14) ?? .init()
        case .button1:
            return UIFont(font: DesignSystemFontFamily.Pretendard.semiBold, size: 18) ?? .init()
        case .button2:
            return UIFont(font: DesignSystemFontFamily.Pretendard.semiBold, size: 16) ?? .init()
        case .button3:
            return UIFont(font: DesignSystemFontFamily.Pretendard.semiBold, size: 14) ?? .init()
        case .context:
            return UIFont(font: DesignSystemFontFamily.Pretendard.medium, size: 16) ?? .init()
        case .caption:
            return UIFont(font: DesignSystemFontFamily.Pretendard.regular, size: 12) ?? .init()
        case .code:
            return UIFont(font: DesignSystemFontFamily.Pretendard.regular, size: 16) ?? .init()
        }
    }
}
