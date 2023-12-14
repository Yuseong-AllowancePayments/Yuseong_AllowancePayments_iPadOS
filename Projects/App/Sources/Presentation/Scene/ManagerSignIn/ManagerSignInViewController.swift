import UIKit
import SnapKit
import Then
import DesignSystem

class ManagerSignInViewController: BaseVC<ManagerSignInViewModel> {
    private let titleView = UIView().then {
        $0.backgroundColor = .clear
    }
    private let logoImageView = UIImageView().then {
        $0.image = .Image.logo
    }
    private let titleLabel = UILabel().then {
        $0.text = "유성구청 보훈 수당 지급 자동화 프로그램"
        $0.textColor = .color(.grayScale(.g90))
        $0.font = .pretendard(.h2)
    }
    private let contentLabel = UILabel().then {
        $0.text = "담당자 로그인"
        $0.textColor = .color(.grayScale(.g90))
        $0.font = .pretendard(.h2)
    }
    private let detailLabel = UILabel().then {
        $0.text = "관리자 인증 PIN 번호를 입력해주세요."
        $0.textColor = .color(.grayScale(.g90))
        $0.font = .pretendard(.p1)
    }
    private let ellipsisBackView = UIView().then {
        $0.backgroundColor = .clear
    }
    private let firstEllipsisImage = UIImageView().then {
        $0.image = UIImage(systemName: "circle.fill")
        $0.tintColor = .color(.grayScale(.g30))
    }
    private let secondEllipsisImage = UIImageView().then {
        $0.image = UIImage(systemName: "circle.fill")
        $0.tintColor = .color(.grayScale(.g30))
    }
    private let thirdEllipsisImage = UIImageView().then {
        $0.image = UIImage(systemName: "circle.fill")
        $0.tintColor = .color(.grayScale(.g30))
    }
    private let fourthEllipsisImage = UIImageView().then {
        $0.image = UIImage(systemName: "circle.fill")
        $0.tintColor = .color(.grayScale(.g30))
    }
    private let pinTextField = UITextField().then {
        $0.textColor = .clear
        $0.backgroundColor = .clear
        $0.keyboardType = .numberPad
        $0.tintColor = .clear
    }
    private let signInButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.font = .pretendard(.context)
        $0.titleLabel?.textColor = .white
        $0.backgroundColor = .color(.primary(.primary))
        $0.layer.cornerRadius = 8
    }
    override func addView() {
        [
            titleView,
            contentLabel,
            detailLabel,
            ellipsisBackView,
            signInButton
        ].forEach { view.addSubview($0) }
        [
            logoImageView,
            titleLabel
        ].forEach { titleView.addSubview($0) }
        [
            firstEllipsisImage,
            secondEllipsisImage,
            thirdEllipsisImage,
            fourthEllipsisImage,
            pinTextField
        ].forEach { ellipsisBackView.addSubview($0) }
    }
    override func configureVC() {
        
    }
    // swiftlint:disable function_body_length
    override func setLayout() {
        titleView.snp.makeConstraints {
            $0.centerX.equalToSuperview().offset(-255)
            $0.top.equalTo(view.snp.centerY).offset(-251)
        }
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom).offset(94)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.468)
        }
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.468)
        }
        ellipsisBackView.snp.makeConstraints {
            $0.top.equalTo(detailLabel.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(200)
            $0.width.equalToSuperview().multipliedBy(0.468)
        }
        firstEllipsisImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalTo(view.snp.centerX).offset(-125)
            $0.width.height.equalTo(UIScreen.main.bounds.width * 0.019)
        }
        secondEllipsisImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalTo(view.snp.centerX).offset(-40)
            $0.width.height.equalTo(UIScreen.main.bounds.width * 0.019)
        }
        thirdEllipsisImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalTo(view.snp.centerX).offset(40)
            $0.width.height.equalTo(UIScreen.main.bounds.width * 0.019)
        }
        fourthEllipsisImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalTo(view.snp.centerX).offset(125)
            $0.width.height.equalTo(UIScreen.main.bounds.width * 0.019)
        }
        pinTextField.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        signInButton.snp.makeConstraints {
            $0.top.equalTo(ellipsisBackView.snp.bottom).offset(22)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.468)
            $0.height.equalTo(60)
        }
        logoImageView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(52)
            $0.height.equalTo(46)
        }
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(logoImageView.snp.right).offset(8)
        }
    }
    // swiftlint:enable function_body_length
}
