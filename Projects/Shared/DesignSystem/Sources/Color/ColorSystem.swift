import UIKit

public extension UIColor {
    enum Colors {
        case grayScale(GrayScale)
        case primary(Primary)
        case system(System)
    }

    static func color(_ style: Colors) -> UIColor {
        switch style {
        case let .grayScale(colorable as Colorable),
             let .primary(colorable as Colorable),
             let .system(colorable as Colorable):
            return colorable.color
        }
    }
}
