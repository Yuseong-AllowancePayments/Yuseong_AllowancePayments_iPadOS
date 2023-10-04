import UIKit

public final class SelectTypeButton: UIButton {
    private var title: String

    public init(title: String = "") {
        self.title = title
        super.init(frame: .zero)
        setUpButton()
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
    }
}
