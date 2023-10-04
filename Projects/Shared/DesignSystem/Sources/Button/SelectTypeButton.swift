import UIKit

public final class SelectTypeButton: UIButton {
    private var title: String

    public init(title: String = "") {
        self.title = title
        super.init(frame: .zero)
        setUpButton()
        self.addAction {
            self.isSelected.toggle()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SelectTypeButton {
    func setUpButton() {
        self.setTitle("\(title)", for: .normal)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 1
//        if self.isSelected {
//            self.layer.borderColor = UIColor.color(.primary(.primary)).cgColor
//            self.setTitleColor(.color(.primary(.primary)), for: .normal)
//            self.backgroundColor = .color(.primary(.background))
//        } else {
//            self.layer.borderColor = UIColor.color(.grayScale(.g20)).cgColor
//            self.setTitleColor(.color(.grayScale(.g60)), for: .normal)
//            self.backgroundColor = .white
//        }
    }
}

public extension UIControl {
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping () -> Void) {
    }
}
