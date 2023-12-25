import UIKit
import Then
import SnapKit
import DesignSystem

class StoppageTableViewCell: UITableViewCell {

    static let identifier = "StoppageTableViewCell"

    private let serialNumLabel = UITextField().then {
        $0.setDataCell(backGroundColor: UIColor.color(.grayScale(.g10)))
    }
    private let administrativeAddressLabel = UITextField().then {
        $0.setDataCell()
    }
    private let affairsNumLabel = UITextField().then {
        $0.setDataCell()
    }
    private let nameLabel = UITextField().then {
        $0.setDataCell()
    }
    private let sinLabel = UITextField().then {
        $0.setDataCell()
    }
    private let addressLabel = UITextField().then {
        $0.setDataCell()
    }
    private let depositTypeLabel = UITextField().then {
        $0.setDataCell()
    }
    private let bankNameLabel = UITextField().then {
        $0.setDataCell()
    }
    private let accountOwnerLabel = UITextField().then {
        $0.setDataCell()
    }
    private let accountLabel = UITextField().then {
        $0.setDataCell()
    }
    private let stoppageReasonLabel = UITextField().then {
        $0.setDataCell()
    }
    private let stoppageDateLabel = UITextField().then {
        $0.setDataCell()
    }
    private let noteLabel = UITextField().then {
        $0.setDataCell()
    }
    private let moveInAddressLabel = UITextField().then {
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
        note: String,
        stoppageReason: String,
        stoppageDate: String,
        moveInAddress: String
    ) {
        setupLayout()
        self.serialNumLabel.text = serialNum
        self.administrativeAddressLabel.text = administrativeAddress
        self.affairsNumLabel.text = affairsNum
        self.sinLabel.text = sin
        self.nameLabel.text = name
        self.addressLabel.text = address
        self.depositTypeLabel.text = depositType
        self.bankNameLabel.text = bankName
        self.accountOwnerLabel.text = accountOwner
        self.accountLabel.text = account
        self.noteLabel.text = note
        self.stoppageReasonLabel.text = stoppageReason
        self.stoppageDateLabel.text = stoppageDate
        self.moveInAddressLabel.text = moveInAddress
    }
    // swiftlint:enable function_parameter_count
}

private extension StoppageTableViewCell {
    func setupLayout() {
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
            $0.width.equalTo(100)
        }
        administrativeAddressLabel.snp.makeConstraints {
            $0.leading.equalTo(serialNumLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148 + 2)
        }
        affairsNumLabel.snp.makeConstraints {
            $0.leading.equalTo(administrativeAddressLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(178 + 2)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(affairsNumLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148 + 2)
        }
        sinLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(198 + 2)
        }
        addressLabel.snp.makeConstraints {
            $0.leading.equalTo(sinLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(398 + 2)
        }
        depositTypeLabel.snp.makeConstraints {
            $0.leading.equalTo(addressLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148 + 2)
        }
        bankNameLabel.snp.makeConstraints {
            $0.leading.equalTo(depositTypeLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(198 + 2)
        }
        accountOwnerLabel.snp.makeConstraints {
            $0.leading.equalTo(bankNameLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148 + 2)
        }
        accountLabel.snp.makeConstraints {
            $0.leading.equalTo(accountOwnerLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(198 + 2)
        }
        stoppageReasonLabel.snp.makeConstraints {
            $0.leading.equalTo(accountLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148 + 2)
        }
        stoppageDateLabel.snp.makeConstraints {
            $0.leading.equalTo(stoppageReasonLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(148 + 2)
        }
        noteLabel.snp.makeConstraints {
            $0.leading.equalTo(stoppageDateLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(298 + 2)
        }
        moveInAddressLabel.snp.makeConstraints {
            $0.leading.equalTo(noteLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(200)
        }
    }
}
