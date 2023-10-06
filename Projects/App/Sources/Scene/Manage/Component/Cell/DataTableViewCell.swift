import UIKit
import Then
import SnapKit
import DesignSystem

class DataTableViewCell: UITableViewCell {

    static let identifier = "DataTableViewCell"

    private lazy var numberLabel = PaddingLabel().then {
        $0.setDataCellLabel(backGroundColor: UIColor.color(.grayScale(.g10)))
    }
    private lazy var administrativeBuildingLabel = PaddingLabel().then {
        $0.setDataCellLabel()
    }
    private lazy var veteransAffairsNumberLabel = PaddingLabel().then {
        $0.setDataCellLabel()
    }
    private lazy var nameLabel = PaddingLabel().then {
        $0.setDataCellLabel()
    }
    private lazy var residentNumberLabel = PaddingLabel().then {
        $0.setDataCellLabel()
    }
    private lazy var addressLabel = PaddingLabel().then {
        $0.setDataCellLabel()
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

private extension DataTableViewCell {
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
