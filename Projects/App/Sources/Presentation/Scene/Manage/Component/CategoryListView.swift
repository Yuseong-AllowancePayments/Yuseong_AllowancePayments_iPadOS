import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import DesignSystem

class CategoryListView: UIView {
    private let numberLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "연변", isRound: true)
    }
    private let administrativeBuildingLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "행정동")
    }
    private let veteransAffairsNumberLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "보훈번호")
    }
    private let nameLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "성명")
    }
    private let residentNumberLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "주민등록번호")
    }
    private let addressLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "주소")
        $0.layer.cornerRadius = 12
        $0.layer.maskedCorners = .layerMaxXMinYCorner
        $0.clipsToBounds = true
    }
    override func layoutSubviews() {
        [
            numberLabel,
            administrativeBuildingLabel,
            veteransAffairsNumberLabel,
            nameLabel,
            residentNumberLabel,
            addressLabel
        ].forEach { addSubview($0) }

        numberLabel.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(99)
        }
        administrativeBuildingLabel.snp.makeConstraints {
            $0.leading.equalTo(numberLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(158)
        }
        veteransAffairsNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(administrativeBuildingLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(118)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(veteransAffairsNumberLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(98)
        }
        residentNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(178)
        }
        addressLabel.snp.makeConstraints {
            $0.leading.equalTo(residentNumberLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(399)
        }
    }
}
