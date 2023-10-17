import UIKit
import SnapKit
import Then
import DesignSystem

class ManagerSignInViewController: BaseVC<ManagerSignInViewModel> {
    private let titleView = UIView().then {
        $0.contentMode = .scaleAspectFit
    }
    private let logoImage = UIImageView().then {
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
    private let idField = ApplyFieldView(
        title: "아이디",
        placeholder: "아이디를 입력해 주세요.",
        image: ""
    )
    private let pwField = ApplyFieldView(
        title: "비밀번호",
        placeholder: "비밀번호를 입력해 주세요.",
        image: "invisible"
    )
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
            idField,
            pwField,
            signInButton
        ].forEach { view.addSubview($0) }
        [
            logoImage,
            titleLabel
        ].forEach { titleView.addSubview($0) }
    }
    override func configureVC() {
    }
    override func setLayout() {
        titleView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(432)
        }
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom).offset(94)
            $0.left.equalToSuperview().inset(272)
        }
        idField.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(40)
            $0.left.right.equalToSuperview().inset(272)
            $0.height.equalTo(77)
        }
        pwField.snp.makeConstraints {
            $0.top.equalTo(idField.snp.bottom).offset(28)
            $0.left.right.equalToSuperview().inset(272)
            $0.height.equalTo(77)
        }
        signInButton.snp.makeConstraints {
            $0.top.equalTo(pwField.snp.bottom).offset(40)
            $0.left.right.equalToSuperview().inset(272)
            $0.height.equalTo(60)
        }
        logoImage.snp.makeConstraints {            $0.left.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(52)
            $0.height.equalTo(46)
        }
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(logoImage.snp.right).offset(8)
        }
    }
}