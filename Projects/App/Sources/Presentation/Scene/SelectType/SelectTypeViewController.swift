import UIKit
import RxFlow
import RxCocoa
import SnapKit
import Then
import DesignSystem

class SelectTypeViewController: BaseVC<SelectTypeViewModel> {
    private let selectedType = BehaviorRelay<String>(value: "참전유공자 명예 수당")
    private let titleLabel = UILabel().then {
        $0.text = "보훈 수당 지급 신청서 작성"
        $0.font = .pretendard(.h1)
    }
    private let subTitleLabel = UILabel().then {
        $0.text = "신청하실 수당 유형을 선택해주세요."
        $0.font = .pretendard(.p2)
    }
    private let managerSignInButton = UIButton(type: .system).then {
        $0.setTitle("담당자 로그인", for: .normal)
        $0.layer.cornerRadius = 8
        $0.setTitleColor(.color(.grayScale(.g70)), for: .normal)
        $0.backgroundColor = .color(.grayScale(.g10))
        $0.titleLabel?.font = .pretendard(.context)
    }
    private let honorButton = SelectTypeButton(title: "참전유공자 명예 수당")
    private let partnerButton = SelectTypeButton(title: "참전유공자 배우자 수당")
    private let respectButton = SelectTypeButton(title: "보훈 예우 수당")
    private let nextButton = UIButton(type: .system).then {
        $0.titleLabel?.font = .pretendard(.context)
        $0.setTitle("선택", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
        $0.backgroundColor = .color(.primary(.primary))
    }
    override func bind() {
        let input = SelectTypeViewModel.Input(
            managerSignInButtonDidTap: managerSignInButton.rx.tap.asSignal(),
            nextButtonDidTap: nextButton.rx.tap.asSignal(),
            selectType: selectedType
        )
        _ = self.viewModel.transform(input)
    }
    override func configureVC() {
        self.navigationController?.isNavigationBarHidden = true
        selectedType
            .subscribe(onNext: { [self] value in
                if value == "참전유공자 명예 수당" {
                    honorButton.setEnabled()
                    partnerButton.setDisabled()
                    respectButton.setDisabled()
                } else if value == "참전유공자 배우자 수당" {
                    honorButton.setDisabled()
                    partnerButton.setEnabled()
                    respectButton.setDisabled()
                } else if value == "보훈 예우 수당" {
                    honorButton.setDisabled()
                    partnerButton.setDisabled()
                    respectButton.setEnabled()
                }
            }).disposed(by: disposeBag)
        honorButton.rx.tap
            .subscribe(onNext: { [self] in
                selectedType.accept("참전유공자 명예 수당")
            }).disposed(by: disposeBag)
        partnerButton.rx.tap
            .subscribe(onNext: { [self] in
                selectedType.accept("참전유공자 배우자 수당")
            }).disposed(by: disposeBag)
        respectButton.rx.tap
            .subscribe(onNext: { [self] in
                selectedType.accept("보훈 예우 수당")
            }).disposed(by: disposeBag)
    }

    override func addView() {
        [
            titleLabel,
            subTitleLabel,
            managerSignInButton,
            partnerButton,
            honorButton,
            respectButton,
            nextButton
        ].forEach { view.addSubview($0) }
    }
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.snp.centerY).offset(UIScreen.main.bounds.height * (-0.215))
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(50)
        }
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.left.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.height.equalTo(26)
        }
        managerSignInButton.snp.makeConstraints {
            $0.top.equalTo(view.snp.centerY).offset(UIScreen.main.bounds.height * (-0.215))
            $0.right.equalToSuperview().inset(UIScreen.main.bounds.width * 0.062)
            $0.width.equalTo(119)
            $0.height.equalTo(40)
        }
        partnerButton.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(64)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.276)
            $0.height.equalTo(160)
        }
        honorButton.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(64)
            $0.width.equalToSuperview().multipliedBy(0.276)
            $0.right.equalTo(partnerButton.snp.left).offset(-24)
            $0.height.equalTo(160)
        }
        respectButton.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(64)
            $0.left.equalTo(partnerButton.snp.right).offset(24)
            $0.width.equalToSuperview().multipliedBy(0.276)
            $0.height.equalTo(160)
        }
        nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(partnerButton.snp.bottom).offset(72)
            $0.height.equalTo(60)
            $0.width.equalToSuperview().multipliedBy(0.234)
        }
    }
}
