import UIKit
import SnapKit
import Then
import DesignSystem
import RxFlow
import RxCocoa
import RxSwift

// swiftlint:disable type_body_length
class CourtesyApplyViewController: BaseVC<ApplyViewModel> {
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
    private let veteranTypeField = ApplyFieldView(
        title: "보훈대상자 구분",
        placeholder: "구분을 입력해주세요.",
        image: ""
    )
    private let affairsNumField = ApplyFieldView(
        title: "보훈 번호",
        placeholder: "보훈 번호를 입력해주세요.",
        image: ""
    )
    private let postAddressField = ApplyFieldView(
        title: "신청인 우편번호",
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
    private let applicantNameField = ApplyFieldView(
        title: "신청인 성명",
        placeholder: "신청인의 성명을 입력해주세요.",
        image: ""
    )
    private let applicantBirthDateField = ApplyFieldView(
        title: "신청인 생년월일",
        placeholder: "신청인의 생년월일을 입력해주세요.  예) 2023-01-01",
        image: ""
    )
    private let applicantSinField = ApplyFieldView(
        title: "신청인 주민등록번호",
        placeholder: "신청인의 주민등록번호를 입력해주세요.",
        image: ""
    )
    private let applicantGenderField = ApplyFieldView(
        title: "신청인 성별",
        placeholder: "신청인의 성별을 입력해주세요.",
        image: ""
    )
    private let phoneNumField = ApplyFieldView(
        title: "신청인 전화번호",
        placeholder: "신청인의 전화번호를 입력해주세요.",
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
    private let noticeLabel = UILabel().then {
        $0.font = .pretendard(.h4)
        $0.textColor = .color(.grayScale(.g90))
        $0.text = "아래는 보훈 대상자가 유족일 경우에만 입력해주세요."
    }
    private let relationField = ApplyFieldView(
        title: "가족 관계",
        placeholder: "보훈 대상자와의 가족 관계를 입력해주세요.  예) 자녀",
        image: ""
    )
    private let priorityField = ApplyFieldView(
        title: "선순위 유족 여부",
        placeholder: "선순위 유족 여부를 입력해주세요.  예) 예",
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
            veteranTypeField,
            affairsNumField,
            postAddressField,
            findAddressButton,
            roadAddressField,
            applicantNameField,
            applicantBirthDateField,
            applicantSinField,
            applicantGenderField,
            phoneNumField,
            bankNameField,
            accountOwnerField,
            accountField,
            moveInField,
            noticeLabel,
            relationField,
            priorityField,
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
            $0.height.equalTo(1500)
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
        veteranTypeField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(64)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        affairsNumField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(64)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        postAddressField.snp.makeConstraints {
            $0.top.equalTo(veteranTypeField.snp.bottom).offset(40)
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
        applicantNameField.snp.makeConstraints {
            $0.top.equalTo(roadAddressField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        applicantBirthDateField.snp.makeConstraints {
            $0.top.equalTo(roadAddressField.snp.bottom).offset(40)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        applicantSinField.snp.makeConstraints {
            $0.top.equalTo(applicantNameField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        applicantGenderField.snp.makeConstraints {
            $0.top.equalTo(applicantBirthDateField.snp.bottom).offset(40)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        phoneNumField.snp.makeConstraints {
            $0.top.equalTo(applicantSinField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        bankNameField.snp.makeConstraints {
            $0.top.equalTo(applicantGenderField.snp.bottom).offset(40)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        accountOwnerField.snp.makeConstraints {
            $0.top.equalTo(phoneNumField.snp.bottom).offset(40)
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
            $0.top.equalTo(accountOwnerField.snp.bottom).offset(40)
            $0.left.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        noticeLabel.snp.makeConstraints {
            $0.top.equalTo(moveInField.snp.bottom).offset(64)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
        }
        relationField.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        priorityField.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom).offset(40)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        finishButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.top.equalTo(relationField.snp.bottom).offset(78)
            $0.height.equalTo(60)
        }
    }
    // swiftlint:enable function_body_length
}
// swiftlint:enable type_body_length
