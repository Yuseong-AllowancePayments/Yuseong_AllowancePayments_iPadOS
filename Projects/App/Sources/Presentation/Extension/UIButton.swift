import UIKit

extension UIButton {
    func setEnabled() {
        self.layer.borderColor = UIColor.color(.primary(.primary)).cgColor
        self.setTitleColor(.color(.primary(.primary)), for: .normal)
        self.titleLabel?.font = .pretendard(.h4)
        self.backgroundColor = .color(.primary(.background))
    }
    func setDisabled() {
        self.layer.borderColor = UIColor.color(.grayScale(.g20)).cgColor
        self.setTitleColor(.color(.grayScale(.g60)), for: .normal)
        self.titleLabel?.font = .pretendard(.h4)
        self.backgroundColor = .color(.system(.white))
    }
}
