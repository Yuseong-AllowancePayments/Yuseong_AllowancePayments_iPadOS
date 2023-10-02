import Foundation
import UIKit

public final class ApplyFieldView: UIView {
    private let label: UILabel = {
        $0.numberOfLines = 0
        $0.font = .pretendard(.context)
        $0.textColor = .color(.grayScale(.g90))
        return $0
    }(UILabel())

    private let textField = ApplyTextField()

    public var title: String {
        get { label.text ?? "" }
        set { label.text = newValue }
    }
    public var placeholder: String {
        get { textField.placeholder ?? "" }
        set { textField.placeholder = newValue }
    }
    public var imageName: String {
        get { textField.imageName ?? ""}
        set { textField.imageName = newValue }
    }

    public init(
        title: String,
        placeholder: String,
        imageName: String
    ) {
        super.init(frame: .zero)
        self.title = title
        self.placeholder = placeholder
        self.imageName = imageName
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public static func applyTextFieldView(
        title: String,
        placeholder: String,
        imageName: String
    ) {
        let fieldView = ApplyFieldView(
            title: title,
            placeholder: placeholder,
            imageName: imageName
        )

        guard let window = UIApplication.currentWindow() else { return }
        window.addSubview(fieldView)
    }

    func setUpView() {
        [ label, textField ].forEach { self.addSubview($0) }
        setLayout()
        self.backgroundColor = .clear
        self.alpha = 0
    }

    func setLayout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            label.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 21),
            textField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            textField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}
