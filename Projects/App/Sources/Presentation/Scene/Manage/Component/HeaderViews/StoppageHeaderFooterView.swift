import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import DesignSystem

class StoppageHeaderFooterView: UITableViewHeaderFooterView {
    static let identifier = "StoppageHeaderFooterView"
    private let serialNumLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "연변", isLeftRound: true)
    }
    private let administrativeAddressLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "동 명")
    }
    private let affairsNumLabel = PaddingLabel().then {
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
        $0.setCategoryCellLabel(text: "지급방법")
    }
    private let bankNameLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "은행명")
    }
    private let accountOwnerLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "예금주")
    }
    private let accountLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "계좌번호")
    }
    private let stoppageReasonLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "중단사유")
    }
    private let stoppageDateLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "중단사유 발생일")
    }
    private let noteLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "비고")
    }
    private let moveInAddressLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "전입지 주소", isRightRound: true)
    }
    override func layoutSubviews() {
        [
            serialNumLabel,
            administrativeAddressLabel,
            affairsNumLabel,
            nameLabel,
            sinLabel,
            addressLabel,
            depositTypeLabel,
            bankNameLabel,
            accountOwnerLabel,
            accountLabel,
            stoppageReasonLabel,
            stoppageDateLabel,
            noteLabel,
            moveInAddressLabel
        ].forEach { addSubview($0) }

        serialNumLabel.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(99)
        }
        administrativeAddressLabel.snp.makeConstraints {
            $0.leading.equalTo(serialNumLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        affairsNumLabel.snp.makeConstraints {
            $0.leading.equalTo(administrativeAddressLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(178)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(affairsNumLabel.snp.trailing).offset(2)
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
        bankNameLabel.snp.makeConstraints {
            $0.leading.equalTo(depositTypeLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(198)
        }
        accountOwnerLabel.snp.makeConstraints {
            $0.leading.equalTo(bankNameLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        accountLabel.snp.makeConstraints {
            $0.leading.equalTo(accountOwnerLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(198)
        }
        stoppageReasonLabel.snp.makeConstraints {
            $0.leading.equalTo(accountLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        stoppageDateLabel.snp.makeConstraints {
            $0.leading.equalTo(stoppageReasonLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        noteLabel.snp.makeConstraints {
            $0.leading.equalTo(stoppageDateLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(298)
        }
        moveInAddressLabel.snp.makeConstraints {
            $0.leading.equalTo(noteLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(199)
        }
    }
}
