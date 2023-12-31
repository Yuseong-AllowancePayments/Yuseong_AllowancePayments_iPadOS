import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import DesignSystem

class CashPaymentTableViewCell: UITableViewCell {
    static let identifier = "CashPaymentTableViewCell"
    private let serialNumLabel = UITextField().then {
        $0.setDataCell(backGroundColor: UIColor.color(.grayScale(.g10)))
    }
    private let administrativeAddressLabel = UITextField().then {
        $0.setDataCell()
    }
    private let affairsNumsLabel = UITextField().then {
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
    private let sibiLabel = UITextField().then {
        $0.setDataCell()
    }
    private let gubiLabel = UITextField().then {
        $0.setDataCell()
    }
    private let noteLabel = UITextField().then {
        $0.setDataCell()
    }
    // swiftlint:disable function_parameter_count
    func setUpView(
        serialNum: String,
        administrativeAddress: String,
        affairsNum: String,
        sin: String,
        name: String,
        address: String,
        depositType: String,
        sibi: String,
        gubi: String,
        note: String
    ) {
        setupLayout()
        self.serialNumLabel.text = serialNum
        self.administrativeAddressLabel.text = administrativeAddress
        self.affairsNumsLabel.text = affairsNum
        self.sinLabel.text = sin
        self.nameLabel.text = name
        self.addressLabel.text = address
        self.depositTypeLabel.text = depositType
        self.sibiLabel.text = sibi
        self.gubiLabel.text = gubi
        self.noteLabel.text = note
    }
    // swiftlint:enable function_parameter_count
}
// swiftlint:disable function_body_length
extension CashPaymentTableViewCell {
    func setupLayout() {
        [
            serialNumLabel,
            administrativeAddressLabel,
            affairsNumsLabel,
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
            $0.width.equalTo(100)
        }
        administrativeAddressLabel.snp.makeConstraints {
            $0.leading.equalTo(serialNumLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(160)
        }
        affairsNumsLabel.snp.makeConstraints {
            $0.leading.equalTo(administrativeAddressLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(160)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(affairsNumsLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(100)
        }
        sinLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(200)
        }
        addressLabel.snp.makeConstraints {
            $0.leading.equalTo(sinLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(400)
        }
        depositTypeLabel.snp.makeConstraints {
            $0.leading.equalTo(addressLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        sibiLabel.snp.makeConstraints {
            $0.leading.equalTo(depositTypeLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        gubiLabel.snp.makeConstraints {
            $0.leading.equalTo(sibiLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
        noteLabel.snp.makeConstraints {
            $0.leading.equalTo(gubiLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(150)
        }
    }
}
// swiftlint:enable function_body_length
