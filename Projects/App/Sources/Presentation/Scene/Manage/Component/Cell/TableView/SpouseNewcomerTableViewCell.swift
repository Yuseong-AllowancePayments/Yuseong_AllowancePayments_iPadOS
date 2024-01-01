import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import DesignSystem

class SpouseNewcomerTableViewCell: UITableViewCell {
    static let identifier = "SpouseNewcomerTableViewCell"
    private let numberLabel = UITextField().then {
        $0.setDataCell(backGroundColor: UIColor.color(.grayScale(.g10)))
    }
    private let veteransAffairsNumberLabel = UITextField().then {
        $0.setDataCell()
    }
    private let applicantNameLabel = UITextField().then {
        $0.setDataCell()
    }
    private let applicantResidentRegistrationNumberLabel = UITextField().then {
        $0.setDataCell()
    }
    private let applicantPhoneNumberLabel = UITextField().then {
        $0.setDataCell()
    }
    private let applicantPostNumberLabel = UITextField().then {
        $0.setDataCell()
    }
    private let applicantAddressLabel = UITextField().then {
        $0.setDataCell()
    }
    private let administrativeBuildingLabel = UITextField().then {
        $0.setDataCell()
    }
    private let warVeteranNameLabel = UITextField().then {
        $0.setDataCell()
    }
    private let veteranResidentRegistrationNumberLabel = UITextField().then {
        $0.setDataCell()
    }
    private let dateOfDeathOfVeteranLabel = UITextField().then {
        $0.setDataCell()
    }
    private let divisionLabel = UITextField().then {
        $0.setDataCell()
    }
    private let bankNameLabel = UITextField().then {
        $0.setDataCell()
    }
    private let depositorNameLabel = UITextField().then {
        $0.setDataCell()
    }
    private let accountNumberLabel = UITextField().then {
        $0.setDataCell()
    }
    private let moveInDateLabel = UITextField().then {
        $0.setDataCell()
    }
    private let applicationDateLabel = UITextField().then {
        $0.setDataCell()
    }
    private let newApplicationReasonLabel = UITextField().then {
        $0.setDataCell()
    }
    private let noteLabel = UITextField().then {
        $0.setDataCell()
    }
    // swiftlint:disable function_parameter_count
    func setupView(
        number: String,
        veteransAffairsNumber: String,
        applicantName: String,
        applicantResidentRegistrationNumber: String,
        applicantPhoneNumber: String,
        applicantPostNumber: String,
        applicantAddress: String,
        administrativeBuilding: String,
        warVeteranName: String,
        veteranResidentRegistrationNumber: String,
        dateOfDeathOfVeteran: String,
        division: String,
        bankName: String,
        depositorName: String,
        accountNumber: String,
        moveInDate: String,
        applicationDate: String,
        newApplicationReason: String,
        note: String
    ) {
        setupLayout()
        numberLabel.text = number
        veteransAffairsNumberLabel.text = veteransAffairsNumber
        applicantNameLabel.text = applicantName
        applicantResidentRegistrationNumberLabel.text = applicantResidentRegistrationNumber
        applicantPhoneNumberLabel.text = applicantPhoneNumber
        applicantPostNumberLabel.text = applicantPostNumber
        applicantAddressLabel.text = applicantAddress
        administrativeBuildingLabel.text = administrativeBuilding
        warVeteranNameLabel.text = warVeteranName
        veteranResidentRegistrationNumberLabel.text = veteranResidentRegistrationNumber
        dateOfDeathOfVeteranLabel.text = dateOfDeathOfVeteran
        divisionLabel.text = division
        bankNameLabel.text = bankName
        depositorNameLabel.text = depositorName
        accountNumberLabel.text = accountNumber
        moveInDateLabel.text = moveInDate
        applicationDateLabel.text = applicationDate
        newApplicationReasonLabel.text = newApplicationReason
        noteLabel.text = note
    }
    // swiftlint:enable function_parameter_count
}

private extension SpouseNewcomerTableViewCell {
    // swiftlint:disable function_body_length
    func setupLayout() {
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
            $0.width.equalTo(100)
        }
        veteransAffairsNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(numberLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        applicantNameLabel.snp.makeConstraints {
            $0.leading.equalTo(veteransAffairsNumberLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(130)
        }
        applicantResidentRegistrationNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(applicantNameLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(200)
        }
        applicantPhoneNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(applicantResidentRegistrationNumberLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        applicantPostNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(applicantPhoneNumberLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        applicantAddressLabel.snp.makeConstraints {
            $0.leading.equalTo(applicantPostNumberLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(400)
        }
        administrativeBuildingLabel.snp.makeConstraints {
            $0.leading.equalTo(applicantAddressLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(200)
        }
        warVeteranNameLabel.snp.makeConstraints {
            $0.leading.equalTo(administrativeBuildingLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        veteranResidentRegistrationNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(warVeteranNameLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(200)
        }
        dateOfDeathOfVeteranLabel.snp.makeConstraints {
            $0.leading.equalTo(veteranResidentRegistrationNumberLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(190)
        }
        divisionLabel.snp.makeConstraints {
            $0.leading.equalTo(dateOfDeathOfVeteranLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        bankNameLabel.snp.makeConstraints {
            $0.leading.equalTo(divisionLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        depositorNameLabel.snp.makeConstraints {
            $0.leading.equalTo(bankNameLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        accountNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(depositorNameLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        moveInDateLabel.snp.makeConstraints {
            $0.leading.equalTo(accountNumberLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        applicationDateLabel.snp.makeConstraints {
            $0.leading.equalTo(moveInDateLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        newApplicationReasonLabel.snp.makeConstraints {
            $0.leading.equalTo(applicationDateLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        noteLabel.snp.makeConstraints {
            $0.leading.equalTo(newApplicationReasonLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
    }
    // swiftlint:enable function_body_length
}
