import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import DesignSystem

class VeteransAffairsHeaderView: UITableViewHeaderFooterView {
    static let identifier = "VeteransAffairsHeaderView"
    private let numberLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "연변", isLeftRound: true)
    }
    private let veteransAffairsNumberLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "보훈번호")
    }
    private let applicantNameLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "신청인 성명")
    }
    private let applicantResidentRegistrationNumberLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "신청인 주민등록번호")
    }
    private let applicantPhoneNumberLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "신청인 전화번호")
    }
    private let applicantPostNumberLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "신청인 우편번호")
    }
    private let applicantAddressLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "신청인 상세 주소(도로명 주소)")
    }
    private let administrativeBuildingLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "행정동")
    }
    private let warVeteranNameLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "참전유공자 성명")
    }
    private let veteranResidentRegistrationNumberLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "참전유공자 주민등록번호")
    }
    private let dateOfDeathOfVeteranLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "참전유공자 사망일자")
    }
    private let divisionLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "구분")
    }
    private let bankNameLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "은행명")
    }
    private let depositorNameLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "예금주 성명")
    }
    private let accountNumberLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "계좌 번호")
    }
    private let moveInDateLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "전입일")
    }
    private let applicationDateLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "신청일")
    }
    private let newApplicationReasonLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "신규 신청 사유")
    }
    private let noteLabel = PaddingLabel().then {
        $0.setCategoryCellLabel(text: "비고", isRightRound: true)
    }
    // swiftlint:disable function_body_length
    override func layoutSubviews() {
        [
            numberLabel,
            veteransAffairsNumberLabel,
            applicantNameLabel,
            applicantResidentRegistrationNumberLabel,
            applicantPhoneNumberLabel,
            applicantPostNumberLabel,
            applicantAddressLabel,
            administrativeBuildingLabel,
            warVeteranNameLabel,
            veteranResidentRegistrationNumberLabel,
            dateOfDeathOfVeteranLabel,
            divisionLabel,
            bankNameLabel,
            depositorNameLabel,
            accountNumberLabel,
            moveInDateLabel,
            applicationDateLabel,
            newApplicationReasonLabel,
            noteLabel
        ].forEach { addSubview($0) }
        numberLabel.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(99)
        }
        veteransAffairsNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(numberLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        applicantNameLabel.snp.makeConstraints {
            $0.leading.equalTo(veteransAffairsNumberLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(128)
        }
        applicantResidentRegistrationNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(applicantNameLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(198)
        }
        applicantPhoneNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(applicantResidentRegistrationNumberLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        applicantPostNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(applicantPhoneNumberLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        applicantAddressLabel.snp.makeConstraints {
            $0.leading.equalTo(applicantPostNumberLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(398)
        }
        administrativeBuildingLabel.snp.makeConstraints {
            $0.leading.equalTo(applicantAddressLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(198)
        }
        warVeteranNameLabel.snp.makeConstraints {
            $0.leading.equalTo(administrativeBuildingLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        veteranResidentRegistrationNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(warVeteranNameLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(198)
        }
        dateOfDeathOfVeteranLabel.snp.makeConstraints {
            $0.leading.equalTo(veteranResidentRegistrationNumberLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(188)
        }
        divisionLabel.snp.makeConstraints {
            $0.leading.equalTo(dateOfDeathOfVeteranLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        bankNameLabel.snp.makeConstraints {
            $0.leading.equalTo(divisionLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        depositorNameLabel.snp.makeConstraints {
            $0.leading.equalTo(bankNameLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        accountNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(depositorNameLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        moveInDateLabel.snp.makeConstraints {
            $0.leading.equalTo(accountNumberLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        applicationDateLabel.snp.makeConstraints {
            $0.leading.equalTo(moveInDateLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        newApplicationReasonLabel.snp.makeConstraints {
            $0.leading.equalTo(applicationDateLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
        noteLabel.snp.makeConstraints {
            $0.leading.equalTo(newApplicationReasonLabel.snp.trailing).offset(2)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148)
        }
    }
    // swiftlint:enable function_body_length
}
