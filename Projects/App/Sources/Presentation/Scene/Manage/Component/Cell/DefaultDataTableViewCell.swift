import UIKit
import Then
import SnapKit
import DesignSystem

class DefaultDataTableViewCell: UITableViewCell {

    static let identifier = "DefaultDataTableViewCell"

    private lazy var numberLabel = UITextField().then {
        $0.setDataCell(backGroundColor: UIColor.color(.grayScale(.g10)))
    }
    private lazy var administrativeBuildingLabel = UITextField().then {
        $0.setDataCell()
    }
    private lazy var veteransAffairsNumberLabel = UITextField().then {
        $0.setDataCell()
    }
    private lazy var nameLabel = UITextField().then {
        $0.setDataCell()
    }
    private lazy var residentNumberLabel = UITextField().then {
        $0.setDataCell()
    }
    private lazy var addressLabel = UITextField().then {
        $0.setDataCell()
    }
    // swiftlint:disable function_parameter_count
    func setupView(
        number: String,
        administrativeBuilding: String,
        veteransAffairsNumber: String,
        name: String,
        residentNumber: String,
        address: String
    ) {
        setupLayout()
        numberLabel.text = number
        administrativeBuildingLabel.text = administrativeBuilding
        veteransAffairsNumberLabel.text = veteransAffairsNumber
        nameLabel.text = name
        residentNumberLabel.text = residentNumber
        addressLabel.text = address
    }
    // swiftlint:enable function_parameter_count
}

private extension DefaultDataTableViewCell {
    func setupLayout() {
        [
            numberLabel,
            administrativeBuildingLabel,
            veteransAffairsNumberLabel,
            nameLabel,
            residentNumberLabel,
            addressLabel
        ].forEach { addSubview($0) }
        numberLabel.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.width.equalTo(100)
        }
        administrativeBuildingLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(numberLabel.snp.trailing)
            $0.width.equalTo(160)
        }
        veteransAffairsNumberLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(administrativeBuildingLabel.snp.trailing)
            $0.width.equalTo(120)
        }
        nameLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(veteransAffairsNumberLabel.snp.trailing)
            $0.width.equalTo(100)
        }
        residentNumberLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(nameLabel.snp.trailing)
            $0.width.equalTo(180)
        }
        addressLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(residentNumberLabel.snp.trailing)
            $0.width.equalTo(400)
        }
    }
}
