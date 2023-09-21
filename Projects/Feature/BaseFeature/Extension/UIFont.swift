import UIKit

extension UIFont {
    static func pretendard(size fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        let familyName = "Pretendard"

        var weightString: String
        switch weight {
        case .bold:
            weightString = "Blod"
        case .medium:
            weightString = "Medium"
        case .regular:
            weightString = "Regular"
        case .semibold:
            weightString = "SemiBold"
        default:
            weightString = "Regular"
        }

        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize) ?? .systemFont(ofSize: fontSize, weight: weight)
    }
}
