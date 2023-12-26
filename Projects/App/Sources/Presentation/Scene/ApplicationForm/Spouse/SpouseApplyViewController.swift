import UIKit
import WebKit
import SnapKit
import Then
import DesignSystem
import RxFlow
import RxCocoa
import RxSwift

class SpouseApplyViewController: BaseVC<SpouseApplyViewModel> {
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
    private let applicantNameField = ApplyFieldView(
        title: "신청인 성명",
        placeholder: "신청인의 성명을 입력해주세요.",
        image: ""
    )
    private let applicantSinField = ApplyFieldView(
        title: "신청인 주민등록번호",
        placeholder: "신청인의 주민등록번호를 입력해주세요.",
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
        title: "신청인 상세 주소",
        placeholder: "우편번호 찾기 후 상세 주소를 입력해주세요.",
        image: ""
    )
    private let veteranNameField = ApplyFieldView(
        title: "참전유공자 성명",
        placeholder: "참전유공자의 성명을 입력해주세요.",
        image: ""
    )
    private let warNameField = ApplyFieldView(
        title: "구분",
        placeholder: "6.25참전 또는 월남참전을 입력해주세요.",
        image: ""
    )
    private let veteranSinField = ApplyFieldView(
        title: "참전유공자 주민등록번호",
        placeholder: "참전유공자의 주민등록번호를 입력해주세요.",
        image: ""
    )
    private let affairsNumField = ApplyFieldView(
        title: "보훈번호",
        placeholder: "참전유공자의 보훈번호를 입력해주세요.",
        image: ""
    )
    private let deathDateField = ApplyFieldView(
        title: "참전유공자 사망일자",
        placeholder: "참전유공자의 사망일자를 입력해주세요.  예) 2023-01-01",
        image: ""
    )
    private let bankNameField = ApplyFieldView(
        title: "은행명",
        placeholder: "은행명을 입력해주세요.",
        image: ""
    )
    private let accountOwnerField = ApplyFieldView(
        title: "예금주",
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
    private let finishButton = UIButton(type: .system).then {
        $0.setTitle("작성 완료", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .pretendard(.context)
        $0.titleLabel?.textColor = .white
        $0.backgroundColor = .color(.primary(.primary))
        $0.layer.cornerRadius = 8
    }
    private var webView: WKWebView!
    override func bind() {
        let input = SpouseApplyViewModel.Input(
            backButtonDidTap: backButton.rx.tap.asSignal()
        )
        _ = viewModel.transform(input)
        findAddressButton.rx.tap
            .subscribe(onNext: { [self] in
                createdWebView()
            }).disposed(by: disposeBag)
    }
    override func addView() {
        view.addSubview(scrollView)
        scrollView.addSubview(backView)
        [
            backButton,
            titleLabel,
            applicantNameField,
            applicantSinField,
            postAddressField,
            findAddressButton,
            roadAddressField,
            warNameField,
            veteranNameField,
            affairsNumField,
            veteranSinField,
            deathDateField,
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
            $0.height.equalTo(1300)
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
        applicantNameField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(64)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        applicantSinField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(64)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        postAddressField.snp.makeConstraints {
            $0.top.equalTo(applicantNameField.snp.bottom).offset(40)
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
        warNameField.snp.makeConstraints {
            $0.top.equalTo(roadAddressField.snp.bottom).offset(40)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        veteranNameField.snp.makeConstraints {
            $0.top.equalTo(roadAddressField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        veteranSinField.snp.makeConstraints {
            $0.top.equalTo(warNameField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        affairsNumField.snp.makeConstraints {
            $0.top.equalTo(veteranNameField.snp.bottom).offset(40)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        deathDateField.snp.makeConstraints {
            $0.top.equalTo(veteranSinField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        bankNameField.snp.makeConstraints {
            $0.top.equalTo(affairsNumField.snp.bottom).offset(40)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        accountOwnerField.snp.makeConstraints {
            $0.top.equalTo(deathDateField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        accountField.snp.makeConstraints {
            $0.top.equalTo(bankNameField.snp.bottom).offset(40)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        moveInField.snp.makeConstraints {
            $0.top.equalTo(accountField.snp.bottom).offset(40)
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

extension SpouseApplyViewController: WKScriptMessageHandler, WKUIDelegate, WKNavigationDelegate {
  func createdWebView() {
    let contentController = WKUserContentController()
    contentController.add(self, name: "callBackHandler")
    let configuration = WKWebViewConfiguration()
    configuration.userContentController = contentController
    webView = WKWebView(frame: .zero, configuration: configuration)
    self.webView.navigationDelegate = self
    backView.addSubview(webView)
    webView.layer.borderColor = UIColor.color(.grayScale(.g70)).cgColor
    webView.layer.borderWidth = 1
    webView.snp.makeConstraints {
      $0.top.bottom.equalToSuperview().inset(200)
      $0.left.right.equalToSuperview().inset(150)
    }
    guard let url = URL(string: "http://daum-address-webview.vercel.app/"),
       let webView = webView
    else { return }
    let request = URLRequest(url: url)
    webView.load(request)
  }
  func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
    if let data = message.body as? [String: Any] {
      postAddressField.textField.text = data["zonecode"] as? String ?? ""
      roadAddressField.textField.text = "\(data["roadAddress"] as? String ?? "")" +
                        " (\(data["buildingName"] as? String ?? ""))"
    }
    webView.removeFromSuperview()
  }
}
