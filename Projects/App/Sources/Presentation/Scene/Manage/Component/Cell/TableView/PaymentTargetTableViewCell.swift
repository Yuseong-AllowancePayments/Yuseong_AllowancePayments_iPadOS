import UIKit
import Then
import SnapKit
import DesignSystem

class PaymentTargetTableViewCell: UITableViewCell {

    static let identifier = "PaymentTargetTableViewCell"

    private lazy var serialNumLabel = UITextField().then {
        $0.setDataCell(backGroundColor: UIColor.color(.grayScale(.g10)))
    }
    private lazy var administrativeAddressLabel = UITextField().then {
        $0.setDataCell()
    }
    private lazy var affairsNumLabel = UITextField().then {
        $0.setDataCell()
    }
    private lazy var sinLabel = UITextField().then {
        $0.setDataCell()
    }
    private lazy var nameLabel = UITextField().then {
        $0.setDataCell()
    }
    private lazy var addressLabel = UITextField().then {
        $0.setDataCell()
    }
    private lazy var depositTypeLabel = UITextField().then {
        $0.setDataCell()
    }
    private lazy var bankNameLabel = UITextField().then {
        $0.setDataCell()
    }
    private lazy var accountOwnerLabel = UITextField().then {
        $0.setDataCell()
    }
    private lazy var accountLabel = UITextField().then {
        $0.setDataCell()
    }
    private lazy var sibiLabel = UITextField().then {
        $0.setDataCell()
    }
    private lazy var gubiLabel = UITextField().then {
        $0.setDataCell()
    }
    private lazy var noteLabel = UITextField().then {
        $0.setDataCell()
    }
    // swiftlint:disable function_parameter_count
    func setupView(
        serialNum: String,
        administrativeAddress: String,
        affairsNum: String,
        sin: String,
        name: String,
        address: String,
        depositType: String,
        bankName: String,
        accountOwner: String,
        account: String,
        sibi: String,
        gubi: String,
        note: String
    ) {
        setupLayout()
        serialNumLabel.text = serialNum
        administrativeAddressLabel.text = administrativeAddress
        affairsNumLabel.text = affairsNum
        sinLabel.text = sin
        nameLabel.text = name
        addressLabel.text = address
        depositTypeLabel.text = depositType
        bankNameLabel.text = bankName
        accountOwnerLabel.text = accountOwner
        accountLabel.text = account
        sibiLabel.text = sibi
        gubiLabel.text = gubi
        noteLabel.text = note
    }
    // swiftlint:enable function_parameter_count
}

private extension PaymentTargetTableViewCell {
    func setupLayout() {
        [
            serialNumLabel,
            administrativeAddressLabel,
            affairsNumLabel,
            sinLabel,
            nameLabel,
            addressLabel,
            depositTypeLabel,
            bankNameLabel,
            accountOwnerLabel,
            accountLabel,
            sibiLabel,
            gubiLabel,
            noteLabel
        ].forEach { addSubview($0) }
        serialNumLabel.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.width.equalTo(100)
        }
        administrativeAddressLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(serialNumLabel.snp.trailing)
            $0.width.equalTo(160)
        }
        affairsNumLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(administrativeAddressLabel.snp.trailing)
            $0.width.equalTo(120)
        }
        sinLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(affairsNumLabel.snp.trailing)
            $0.width.equalTo(120)
        }
        nameLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(sinLabel.snp.trailing)
            $0.width.equalTo(100)
        }
        addressLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(nameLabel.snp.trailing)
            $0.width.equalTo(400)
        }
        depositTypeLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(addressLabel.snp.trailing)
            $0.width.equalTo(100)
        }
        bankNameLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(depositTypeLabel.snp.trailing)
            $0.width.equalTo(100)
        }
        accountOwnerLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(bankNameLabel.snp.trailing)
            $0.width.equalTo(100)
        }
        accountLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(bankNameLabel.snp.trailing)
            $0.width.equalTo(180)
        }
        sibiLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(accountLabel.snp.trailing)
            $0.width.equalTo(180)
        }
        gubiLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(sibiLabel.snp.trailing)
            $0.width.equalTo(180)
        }
        noteLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(gubiLabel.snp.trailing)
            $0.width.equalTo(400)
        }
    }
}
