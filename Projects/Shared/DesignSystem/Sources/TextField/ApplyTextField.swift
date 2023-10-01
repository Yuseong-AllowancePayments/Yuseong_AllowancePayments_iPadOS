import UIKit

public final class ApplyTextField: UITextField {
    override public var placeholder: String? {
        didSet { setNeedsDisplay() }
    }

    public init(placeholder: String? = "") {
        super.init(frame: .zero)
        self.placeholder = placeholder
        setupTextField()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func becomeFirstResponder() -> Bool {
        let didBecomeFirstResponder = super.becomeFirstResponder()
        if didBecomeFirstResponder {
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.color(.grayScale(.g20)).cgColor
        }
        return didBecomeFirstResponder
    }

    override public func resignFirstResponder() -> Bool {
        let didResignFirstResponder = super.resignFirstResponder()
        if didResignFirstResponder {
            self.layer.borderWidth = 0
            self.layer.borderColor = nil
        }
        return didResignFirstResponder
    }

    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        setPlaceholderTextColor()
    }

    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(
            by: UIEdgeInsets(
                top: 0,
                left: TextFieldProperty.Dimension.leftMargin,
                bottom: 0,
                right:
                    TextFieldProperty.Dimension.rightMargin
            )
        )
    }

    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(
            by: UIEdgeInsets(
                top: 0,
                left: TextFieldProperty.Dimension.leftMargin,
                bottom: 0,
                right:
                    TextFieldProperty.Dimension.rightMargin
            )
        )
    }
}

private extension ApplyTextField {
    func setupTextField() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.color(.grayScale(.g20)).cgColor
        self.backgroundColor = .color(.system(.white))
        self.font = .pretendard(.p2)
        self.clearButtonMode = .whileEditing
        self.clipsToBounds = true
        self.layer.cornerRadius = 8

        self.isEnabled = true
        self.textColor = .color(.grayScale(.g80))
        self.layer.borderWidth = 0
        self.layer.borderColor = nil
    }

    func setPlaceholderTextColor() {
        let placeholderTextColor = UIColor.color(.grayScale(.g40))

        guard let placeholder else { return }
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                .foregroundColor: placeholderTextColor
            ]
        )
    }
}
