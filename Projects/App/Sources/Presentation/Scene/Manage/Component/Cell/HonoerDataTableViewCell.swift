import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import DesignSystem

class HonoerDataTableViewCell: UITableViewCell {
    static let identifier = "HonoerDataTableViewCell"
    private let numberLabel = UITextField().then {
        $0.setDataCell(backGroundColor: UIColor.color(.grayScale(.g10)))
    }
    private let warRegistrationNumberLabel = UITextField().then {
        $0.setDataCell()
    }
    private let nameLabel = UITextField().then {
        $0.setDataCell()
    }
    private let residentRegistrationNumberLabel = UITextField().then {
        $0.setDataCell()
    }
    private let birthDayLabel = UITextField().then {
        $0.setDataCell()
    }
    private let postNumberLabel = UITextField().then {
        $0.setDataCell()
    }
    private let addressLabel = UITextField().then {
        $0.setDataCell()
    }
    private let phoneNumberLabel = UITextField().then {
        $0.setDataCell()
    }
    private let bankNameLabel = UITextField().then {
        $0.setDataCell()
    }
    private let accountNumberLabel = UITextField().then {
        $0.setDataCell()
    }
    private let accountHolderNameLabel = UITextField().then {
        $0.setDataCell()
    }
    private let moveInDateLabel = UITextField().then {
        $0.setDataCell()
    }
    private let applicationDateLabel = UITextField().then {
        $0.setDataCell()
    }
    private let applicationReasonLabel = UITextField().then {
        $0.setDataCell()
    }
    private let noteLabel = UITextField().then {
        $0.setDataCell()
    }
    // swiftlint:disable function_parameter_count
    func setupView(
        number: String,
        warRegistrationNumber: String,
        name: String,
        residentRegistrationNumber: String,
        birthDay: String,
        postNumber: String,
        address: String,
        phoneNumber: String,
        bankName: String,
        accountNumber: String,
        accountHolderName: String,
        moveInDate: String,
        applicationDate: String,
        applicationReason: String,
        note: String
    ) {
        setupLayout()
        numberLabel.text = number
        warRegistrationNumberLabel.text = warRegistrationNumber
        nameLabel.text = name
        residentRegistrationNumberLabel.text = residentRegistrationNumber
        birthDayLabel.text = birthDay
        postNumberLabel.text = postNumber
        addressLabel.text = address
        phoneNumberLabel.text = phoneNumber
        bankNameLabel.text = bankName
        accountNumberLabel.text = accountNumber
        accountHolderNameLabel.text = accountHolderName
        moveInDateLabel.text = moveInDate
        applicationDateLabel.text = applicationDate
        applicationReasonLabel.text = applicationReason
        noteLabel.text = note
    }
    // swiftlint:enable function_parameter_count
}

private extension HonoerDataTableViewCell {
    func setupLayout() {
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
            $0.width.equalTo(100)
        }
        warRegistrationNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(numberLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(warRegistrationNumberLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(100)
        }
        residentRegistrationNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(200)
        }
        birthDayLabel.snp.makeConstraints {
            $0.leading.equalTo(residentRegistrationNumberLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        postNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(birthDayLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(100)
        }
        addressLabel.snp.makeConstraints {
            $0.leading.equalTo(postNumberLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(400)
        }
        phoneNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(addressLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(200)
        }
        bankNameLabel.snp.makeConstraints {
            $0.leading.equalTo(phoneNumberLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        accountNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(bankNameLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(200)
        }
        accountHolderNameLabel.snp.makeConstraints {
            $0.leading.equalTo(accountNumberLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        moveInDateLabel.snp.makeConstraints {
            $0.leading.equalTo(accountHolderNameLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        applicationDateLabel.snp.makeConstraints {
            $0.leading.equalTo(moveInDateLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        applicationReasonLabel.snp.makeConstraints {
            $0.leading.equalTo(applicationDateLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        noteLabel.snp.makeConstraints {
            $0.leading.equalTo(applicationReasonLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
    }
}
