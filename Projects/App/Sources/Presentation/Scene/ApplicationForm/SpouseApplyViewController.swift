import UIKit
import SnapKit
import Then
import DesignSystem
import RxFlow
import RxCocoa
import RxSwift

class SpouseApplyViewController: BaseVC<ApplyViewModel> {
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
        title: "우편 번호",
        placeholder: "주소를 입력하면 자동 입력됩니다.",
        image: ""
    )
    private let roadAddressField = ApplyFieldView(
        title: "신청인 주소",
        placeholder: "신청인의 주소를 입력해주세요.",
        image: ""
    )
    private let warNameField = ApplyFieldView(
        title: "구분",
        placeholder: "6.25참전 또는 월남참전을 입력해주세요.",
        image: ""
    )
    private let veteranNameField = ApplyFieldView(
        title: "참전유공자 성명",
        placeholder: "참전유공자의 성명을 입력해주세요.",
        image: ""
    )
    private let affairsNumField = ApplyFieldView(
        title: "보훈번호",
        placeholder: "참전유공자의 보훈번호를 입력해주세요.",
        image: ""
    )
    private let veteranSinField = ApplyFieldView(
        title: "참전유공자 주민등록번호",
        placeholder: "참전유공자의 주민등록번호를 입력해주세요.",
        image: ""
    )
    private let deathDateField = ApplyFieldView(
        title: "참전유공자 사망일자",
        placeholder: "참전유공자의 사망일자를 입력해주세요. 예)2023-01-01",
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
    private let finishButton = UIButton().then {
        $0.setTitle("작성 완료", for: .normal)
        $0.titleLabel?.font = .pretendard(.context)
        $0.titleLabel?.textColor = .white
        $0.backgroundColor = .color(.primary(.primary))
        $0.layer.cornerRadius = 8
    }
    override func bind() {
        let input = ApplyViewModel.Input(backButtonDidTap: backButton.rx.tap.asSignal())
        _ = viewModel.transform(input)
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
            roadAddressField,
            warNameField,
            veteranNameField,
            affairsNumField,
            veteranSinField,
            deathDateField,
            bankNameField,
            accountOwnerField,
            accountField,
            finishButton
        ].forEach { backView.addSubview($0) }
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
            $0.top.equalTo(applicantNameField.snp.bottom).offset(64)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        roadAddressField.snp.makeConstraints {
            $0.top.equalTo(applicantSinField.snp.bottom).offset(64)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        warNameField.snp.makeConstraints {
            $0.top.equalTo(postAddressField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        veteranNameField.snp.makeConstraints {
            $0.top.equalTo(roadAddressField.snp.bottom).offset(40)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        affairsNumField.snp.makeConstraints {
            $0.top.equalTo(warNameField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        veteranSinField.snp.makeConstraints {
            $0.top.equalTo(veteranNameField.snp.bottom).offset(40)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        deathDateField.snp.makeConstraints {
            $0.top.equalTo(affairsNumField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        bankNameField.snp.makeConstraints {
            $0.top.equalTo(veteranSinField.snp.bottom).offset(40)
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
        finishButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.top.equalTo(accountField.snp.bottom).offset(78)
            $0.height.equalTo(60)
        }
    }
    // swiftlint:enable function_body_length
}
