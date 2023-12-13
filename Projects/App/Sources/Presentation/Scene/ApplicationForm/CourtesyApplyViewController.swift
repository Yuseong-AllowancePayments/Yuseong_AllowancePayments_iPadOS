import UIKit
import SnapKit
import Then
import DesignSystem
import RxFlow
import RxCocoa
import RxSwift

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
    private let nameField = ApplyFieldView(
        title: "성명",
        placeholder: "성명을 입력해주세요.",
        image: ""
    )
    private let sinField = ApplyFieldView(
        title: "주민등록번호",
        placeholder: "주민등록번호를 입력해주세요.",
        image: ""
    )
    private let affairsNumField = ApplyFieldView(
        title: "보훈 번호",
        placeholder: "보훈 번호를 입력해주세요.",
        image: ""
    )
    private let acquisitionDateField = ApplyFieldView(
        title: "보훈 자격 취득일",
        placeholder: "보훈 자격 취득일을 선택해주세요.",
        image: "calendar"
    )
    private let applicationDateField = ApplyFieldView(
        title: "보훈 수당 신청일",
        placeholder: "보훈 수당 신청일을 선택해주세요.",
        image: "calendar"
    )
    private let moveInDateField = ApplyFieldView(
        title: "전입일",
        placeholder: "전입일을 선택해주세요.",
        image: "calendar"
    )
    private let addressField = ApplyFieldView(
        title: "주소",
        placeholder: "도로명 주소를 입력해주세요.",
        image: ""
    )
    private let depositTypeField = ApplyFieldView(
        title: "입금 유형",
        placeholder: "입금 유형을 입력해주세요.",
        image: ""
    )
    private let bankField = ApplyFieldView(
        title: "은행명",
        placeholder: "은행명을 입력해주세요.",
        image: ""
    )
    private let ownerNameField = ApplyFieldView(
        title: "예금주",
        placeholder: "예금주 성명을 입력해주세요.",
        image: ""
    )
    private let accountField = ApplyFieldView(
        title: "계좌 번호",
        placeholder: "계좌 번호를 입력해주세요.",
        image: ""
    )
    private let etcField = ApplyFieldView(
        title: "비고(기타)",
        placeholder: "비고 사항을 입력해주세요.",
        image: ""
    )
    private let finishButton = UIButton().then {
        $0.setTitle("작성 완료", for: .normal)
        $0.titleLabel?.font = .pretendard(.context)
        $0.titleLabel?.textColor = .white
        $0.backgroundColor = .color(.primary(.primary))
        $0.layer.cornerRadius = 8
    }
    private let spacer = UIView().then {
        $0.backgroundColor = .red
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
            nameField,
            sinField,
            affairsNumField,
            acquisitionDateField,
            applicationDateField,
            moveInDateField,
            addressField,
            depositTypeField,
            bankField,
            ownerNameField,
            accountField,
            etcField,
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
        nameField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(64)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        sinField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(64)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        affairsNumField.snp.makeConstraints {
            $0.top.equalTo(nameField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        acquisitionDateField.snp.makeConstraints {
            $0.top.equalTo(affairsNumField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        applicationDateField.snp.makeConstraints {
            $0.top.equalTo(affairsNumField.snp.bottom).offset(40)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        moveInDateField.snp.makeConstraints {
            $0.top.equalTo(acquisitionDateField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        addressField.snp.makeConstraints {
            $0.top.equalTo(acquisitionDateField.snp.bottom).offset(40)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        depositTypeField.snp.makeConstraints {
            $0.top.equalTo(moveInDateField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        bankField.snp.makeConstraints {
            $0.top.equalTo(addressField.snp.bottom).offset(40)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        ownerNameField.snp.makeConstraints {
            $0.top.equalTo(depositTypeField.snp.bottom).offset(40)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.right.equalTo(backView.snp.centerX).offset(-15)
            $0.height.equalTo(77)
        }
        accountField.snp.makeConstraints {
            $0.top.equalTo(bankField.snp.bottom).offset(40)
            $0.left.equalTo(backView.snp.centerX).offset(15)
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(77)
        }
        etcField.snp.makeConstraints {
            $0.top.equalTo(ownerNameField.snp.bottom).offset(40)
            $0.left.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(179)
        }
        finishButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.top.equalTo(etcField.snp.bottom).offset(48)
            $0.height.equalTo(60)
        }
    }
    // swiftlint:enable function_body_length
}
