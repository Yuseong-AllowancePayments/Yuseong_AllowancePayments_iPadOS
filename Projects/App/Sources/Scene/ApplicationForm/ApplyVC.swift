import UIKit
import SnapKit
import Then
import DesignSystem

class ApplyVC: BaseVC {
    private let backButton = UIButton().then {
        $0.tintColor = .black
        let state = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        let image = UIImage(systemName: "chevron.left", withConfiguration: state)
        $0.setImage(image, for: .normal)
        $0.titleLabel?.font = .pretendard(.h1)
        $0.imageView?.contentMode = .scaleAspectFill
    }
    let titleLabel = UILabel().then {
        $0.font = .pretendard(.h1)
        $0.textColor = .black
    }
    private let nameField = ApplyFieldView(title: "성명", placeholder: "성명을 입력해주세요.", imageName: "")
    private let sinField = ApplyFieldView(title: "주민등록번호", placeholder: "주민등록번호를 입력해주세요.", imageName: "")

    override func addView() {
        [
            backButton,
            titleLabel,
            nameField,
            sinField
        ].forEach { view.addSubview($0) }
    }

    override func configureVC() {
        backButton.rx.tap
            .subscribe(onNext: {
                self.navigationController?.popViewController(animated: true)
            }).disposed(by: disposeBag)
    }

    override func setLayout() {
        backButton.snp.makeConstraints {
            $0.width.height.equalTo(36)
            $0.left.equalToSuperview().inset(64)
            $0.top.equalToSuperview().inset(97)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(90)
            $0.height.equalTo(50)
            $0.left.equalTo(backButton.snp.right).offset(16)
        }
        nameField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(64)
            $0.left.equalToSuperview().inset(64)
            $0.width.equalTo((UIScreen.main.bounds.width - 158)/2)
            $0.height.equalTo(77)
        }
        sinField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(64)
            $0.left.equalTo(nameField.snp.right).offset(30)
            $0.right.equalToSuperview().inset(64)
            $0.height.equalTo(77)
        }
    }
}
