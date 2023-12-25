import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import DesignSystem

class CashPaymentHeaderFooterView: UITableViewHeaderFooterView {
    static let identifier = "CashPaymentHeaderFooterView"
    private let serialNumLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "연변", isLeftRound: true)
    }
    private let administrativeAddressLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "행정동")
    }
    private let affairsNum = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "보훈번호")
    }
    private let nameLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "성명")
    }
    private let sinLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "주민등록번호")
    }
    private let addressLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "주소")
    }
    private let depositTypeLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "입금유형")
    }
    private let sibiLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "시비")
    }
    private let gubiLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "구비")
    }
    private let noteLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "비고", isRightRound: true)
    }
    override func layoutSubviews() {
        [
            serialNumLabel,
            administrativeAddressLabel,
            affairsNum,
            nameLabel,
            sinLabel,
            addressLabel,
            depositTypeLabel,
            sibiLabel,
            gubiLabel,
            noteLabel
        ].forEach { addSubview($0) }

        serialNumLabel.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(99)
        }
        administrativeAddressLabel.snp.makeConstraints {
            $0.leading.equalTo(serialNumLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(158)
        }
        affairsNum.snp.makeConstraints {
            $0.leading.equalTo(administrativeAddressLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(158)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(affairsNum.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        sinLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(198)
        }
        addressLabel.snp.makeConstraints {
            $0.leading.equalTo(sinLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(398)
        }
        depositTypeLabel.snp.makeConstraints {
            $0.leading.equalTo(addressLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        sibiLabel.snp.makeConstraints {
            $0.leading.equalTo(depositTypeLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        gubiLabel.snp.makeConstraints {
            $0.leading.equalTo(sibiLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        noteLabel.snp.makeConstraints {
            $0.leading.equalTo(gubiLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(149)
        }
    }
}
