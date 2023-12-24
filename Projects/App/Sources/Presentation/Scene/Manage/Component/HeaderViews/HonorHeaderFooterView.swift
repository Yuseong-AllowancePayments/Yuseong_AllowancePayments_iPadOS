import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import DesignSystem

class HonorHeaderFooterView: UITableViewHeaderFooterView {
    static let identifier = "HonorHeaderFooterView"
    private let numberLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "연변", isLeftRound: true)
    }
    private let warRegistrationNumberLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "참전등록번호")
    }
    private let nameLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "성명")
    }
    private let residentRegistrationNumberLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "주민등록번호")
    }
    private let birthDayLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "생년월일")
    }
    private let postNumberLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "우편번호")
    }
    private let addressLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "상세 주소(도로명 주소)")
    }
    private let phoneNumberLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "전화번호")
    }
    private let bankNameLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "은행명")
    }
    private let accountNumberLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "계좌 번호")
    }
    private let accountHolderNameLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "예금주 성명")
    }
    private let moveInDateLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "전입일")
    }
    private let applicationDateLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "신청일")
    }
    private let applicationReasonLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "신규 신청 사유")
    }
    private let noteLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "비고", isRightRound: true)
    }
    override func layoutSubviews() {
        [
            numberLabel,
            warRegistrationNumberLabel,
            nameLabel,
            residentRegistrationNumberLabel,
            birthDayLabel,
            postNumberLabel,
            addressLabel,
            phoneNumberLabel,
            bankNameLabel,
            accountNumberLabel,
            accountHolderNameLabel,
            moveInDateLabel,
            applicationDateLabel,
            applicationReasonLabel,
            noteLabel
        ].forEach { addSubview($0) }
        numberLabel.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(99)
        }
        warRegistrationNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(numberLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(warRegistrationNumberLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(98)
        }
        residentRegistrationNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(198)
        }
        birthDayLabel.snp.makeConstraints {
            $0.leading.equalTo(residentRegistrationNumberLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        postNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(birthDayLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(98)
        }
        addressLabel.snp.makeConstraints {
            $0.leading.equalTo(postNumberLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(398)
        }
        phoneNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(addressLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(198)
        }
        bankNameLabel.snp.makeConstraints {
            $0.leading.equalTo(phoneNumberLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        accountNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(bankNameLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(198)
        }
        accountHolderNameLabel.snp.makeConstraints {
            $0.leading.equalTo(accountNumberLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        moveInDateLabel.snp.makeConstraints {
            $0.leading.equalTo(accountHolderNameLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        applicationDateLabel.snp.makeConstraints {
            $0.leading.equalTo(moveInDateLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        applicationReasonLabel.snp.makeConstraints {
            $0.leading.equalTo(applicationDateLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        noteLabel.snp.makeConstraints {
            $0.leading.equalTo(applicationReasonLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
    }
}
