import UIKit
import DesignSystem

@IBDesignable class PaddingLabel: UILabel {
    @IBInspectable var topInset: CGFloat = 0.0
    @IBInspectable var bottomInset: CGFloat = 0.0
    @IBInspectable var leftInset: CGFloat = 20.0
    @IBInspectable var rightInset: CGFloat = 0.0

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
    let size = super.intrinsicContentSize
    return CGSize(width: size.width + leftInset + rightInset, height: size.height + topInset + bottomInset)
    }
    func setDataCellLabel(backGroundColor: UIColor = UIColor.color(.grayScale(.g05))) {
        self.font = .pretendard(.p2)
        self.textColor = .color(.grayScale(.g90))
        self.textAlignment = .left
        self.backgroundColor = backGroundColor
        self.leftInset = 16
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.color(.grayScale(.g20)).cgColor
    }
    func setCategoryCellLabel(text: String, isRound: Bool = false) {
        if isRound {
            self.layer.maskedCorners = .layerMinXMinYCorner
            self.layer.cornerRadius = 12
            self.clipsToBounds = true
        }
        self.backgroundColor = UIColor.color(.primary(.primary))
        self.text = text
        self.textColor = .color(.system(.white))
        self.font = UIFont.pretendard(.p2)
    }
}
