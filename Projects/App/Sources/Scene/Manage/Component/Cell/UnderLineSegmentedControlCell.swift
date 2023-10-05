import UIKit
import Then
import SnapKit
import DesignSystem

class UnderLineSegmentedControlCell: UICollectionViewCell {

    static let identifier = "UnderLineSegmentedControlCell"

    private lazy var titleLabel = UILabel().then {
        $0.font = .pretendard(.h4)
        $0.textColor = .color(.grayScale(.g90))
        $0.textAlignment = .center
    }

    private lazy var underline = UIView().then {
        $0.backgroundColor = .color(.primary(.primary))
        $0.alpha = 0.0
    }

    override var isSelected: Bool {
        didSet {
            UIView.animate(
                withDuration: 0.2,
                animations: { [self] in
                    titleLabel.textColor = isSelected ? .color(.primary(.primary)) : .color(.grayScale(.g90))
                    underline.alpha = isSelected ? 1.0 : 0.0
                }
            )
        }
    }

    func setupView(title: String) {
        setupLayout()
        self.backgroundColor = .clear
        titleLabel.text = title
    }
}

private extension UnderLineSegmentedControlCell {
    func setupLayout() {
        [
            titleLabel,
            underline
        ].forEach { addSubview($0) }
        titleLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(48)
        }
        underline.snp.makeConstraints { make in
            make.height.equalTo(2.0)
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
