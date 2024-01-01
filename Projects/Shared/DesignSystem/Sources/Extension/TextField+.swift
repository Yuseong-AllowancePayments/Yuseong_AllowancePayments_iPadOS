import Foundation
import UIKit

public extension UITextField {
    func setDataCell(backGroundColor: UIColor = UIColor.color(.grayScale(.g05))) {
        self.font = .pretendard(.p2)
        self.textColor = .color(.grayScale(.g90))
        self.textAlignment = .left
        self.backgroundColor = backGroundColor
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.color(.grayScale(.g20)).cgColor
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        self.leftViewMode = .always
    }
}
