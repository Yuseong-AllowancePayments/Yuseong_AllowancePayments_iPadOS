import UIKit
import SnapKit
import Then
import DesignSystem
import RxFlow
import RxCocoa
import RxSwift
import WebKit

class VeteranApplyViewController: BaseVC<VeteranApplyViewModel> {
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    private let backView = UIView().then {
        $0.backgroundColor = .white
    }
    private let backButton = UIButton(type: .system).then {
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
    private let nameField = ApplyFieldView(
        title: "성명",
        placeholder: "성명을 입력해주세요.",
        image: ""
    )
    private let birthDateField = ApplyFieldView(
        title: "생년월일",
        placeholder: "생년월일을 입력해주세요.  예) 2023-01-01",
        image: ""
    )
    private let sinNumField = ApplyFieldView(
        title: "주민등록번호",
        placeholder: "주민등록번호를 입력해주세요.",
        image: ""
    )
    private let registrationNumField = ApplyFieldView(
        title: "참전등록번호",
        placeholder: "참전등록번호를 입력해주세요.",
        image: ""
    )
    private let postAddressField = ApplyFieldView(
        title: "우편번호",
        placeholder: "우편번호 찾기 버튼을 눌러주세요.",
        image: ""
    )
    private let findAddressButton = UIButton(type: .system).then {
        $0.setTitle("우편번호 찾기", for: .normal)
        $0.backgroundColor = .color(.grayScale(.g05))
        $0.setTitleColor(.color(.grayScale(.g90)), for: .normal)
        $0.layer.cornerRadius = 8
        $0.layer.borderColor = UIColor.color(.grayScale(.g90)).cgColor
        $0.layer.borderWidth = 1
    }
    private let roadAddressField = ApplyFieldView(
        title: "상세 주소",
        placeholder: "우편번호 찾기 후 상세 주소를 입력해주세요.",
        image: ""
    )
    private let phoneNumField = ApplyFieldView(
        title: "전화번호",
        placeholder: "전화번호를 입력해주세요.",
        image: ""
    )
    private let bankNameField = ApplyFieldView(
        title: "은행명",
        placeholder: "은행명을 입력해주세요.",
        image: ""
    )
    private let accountOwnerField = ApplyFieldView(
        title: "예금주 성명",
        placeholder: "예금주 성명을 입력해주세요.",
        image: ""
    )
    private let accountField = ApplyFieldView(
        title: "계좌 번호",
        placeholder: "계좌 번호를 입력해주세요.",
        image: ""
    )
    private let moveInField = ApplyFieldView(
        title: "전입일",
        placeholder: "전입일과 지역을 입력해주세요.  예) 2023-01-01(대전 서구)",
        image: ""
    )
    private let finishButton = UIButton().then {
        $0.setTitle("작성 완료", for: .normal)
        $0.titleLabel?.font = .pretendard(.context)
        $0.titleLabel?.textColor = .white
        $0.backgroundColor = .color(.primary(.primary))
        $0.titleLabel?.font = .pretendard(.p2)
        $0.layer.cornerRadius = 8
    }
    override func bind() {
        let input = VeteranApplyViewModel.Input(backButtonDidTap: backButton.rx.tap.asSignal())
        _ = viewModel.transform(input)
    }
    override func addView() {
        view.addSubview(scrollView)
        scrollView.addSubview(backView)
        [
            backButton,
            titleLabel,
            nameField,
            birthDateField,
            sinNumField,
            registrationNumField,
            postAddressField,
            findAddressButton,
            roadAddressField,
            phoneNumField,
            bankNameField,
            accountOwnerField,
            accountField,
            moveInField,
            finishButton
        ].forEach { backView.addSubview($0) }
    }
    override func configureVC() {
        self.hideKeyboardWhenTappedAround()
    }
    // swiftlint:disable function_body_length
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        backView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalToSuperview()
            $0.height.equalTo(1250)
        }
        backButton.snp.makeConstraints {
            $0.width.height.equalTo(36)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.top.equalToSuperview().inset(97)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(90)
            $0.height.equalTo(50)
            $0.left.equalTo(backButton.snp.right).offset(16)
        }
        nameField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(64)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        birthDateField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(64)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        sinNumField.snp.makeConstraints {
            $0.top.equalTo(nameField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        registrationNumField.snp.makeConstraints {
            $0.top.equalTo(birthDateField.snp.bottom).offset(40)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        postAddressField.snp.makeConstraints {
            $0.top.equalTo(sinNumField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        findAddressButton.snp.makeConstraints {
            $0.bottom.equalTo(postAddressField.snp.bottom).offset(-4)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.width.equalTo(120)
            $0.height.equalTo(40)
        }
        roadAddressField.snp.makeConstraints {
            $0.top.equalTo(postAddressField.snp.bottom).offset(40)
            $0.left.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        phoneNumField.snp.makeConstraints {
            $0.top.equalTo(roadAddressField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        accountOwnerField.snp.makeConstraints {
            $0.top.equalTo(roadAddressField.snp.bottom).offset(40)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        bankNameField.snp.makeConstraints {
            $0.top.equalTo(phoneNumField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        accountField.snp.makeConstraints {
            $0.top.equalTo(accountOwnerField.snp.bottom).offset(40)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        moveInField.snp.makeConstraints {
            $0.top.equalTo(bankNameField.snp.bottom).offset(40)
            $0.left.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        finishButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.top.equalTo(moveInField.snp.bottom).offset(78)
            $0.height.equalTo(60)
        }
    }
    // swiftlint:enable function_body_length
}

//extension UIViewController {
//    func callWebView() {
//        let contentController = WKUserContentController()
//        let configuration = WKWebViewConfiguration()
//
//        contentController.add(self, name: "")
//        configuration.userContentController = contentController
//        webView = WKWebView(frame: .zero, configuration: configuration)
//    }
//}
