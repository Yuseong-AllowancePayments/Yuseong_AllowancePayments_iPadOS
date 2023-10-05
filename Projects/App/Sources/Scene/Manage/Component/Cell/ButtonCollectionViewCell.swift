import UIKit
import Then
import SnapKit
import DesignSystem
class ButtonCollectionViewCell: UICollectionViewCell {

    static let identifier = "ButtonCollectionViewCell"

    private let titleLabel = UILabel().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.color(.grayScale(.g20)).cgColor
        $0.textColor = UIColor.color(.grayScale(.g60))
        $0.font = UIFont.pretendard(.p1)
        $0.layer.cornerRadius = 12
        $0.textAlignment = .center
        $0.clipsToBounds = true
    }

    override var isSelected: Bool {
        didSet {
            UIView.animate(
                withDuration: 0.1,
                animations: { [self] in
                    titleLabel.textColor = isSelected ? .color(.primary(.primary)) : .color(.grayScale(.g60))
                    titleLabel.layer.borderColor = isSelected ?
                    UIColor.color(.primary(.primary)).cgColor : UIColor.color(.grayScale(.g20)).cgColor
                    titleLabel.backgroundColor = isSelected ?
                        .color(.primary(.primary)).withAlphaComponent(0.2) : .color(.system(.white))
                    titleLabel.font = isSelected ? UIFont.pretendard(.button1) : UIFont.pretendard(.p1)
                }
            )
        }
    }

    func setupView(title: String) {
        setupLayout()
        titleLabel.text = title
    }
}

private extension ButtonCollectionViewCell {
    func setupLayout() {
        [
            titleLabel
        ].forEach { addSubview($0) }
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(76)
        }
    }
}
