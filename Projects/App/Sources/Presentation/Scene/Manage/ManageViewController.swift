import UIKit
import RxFlow
import SnapKit
import Then
import RxSwift
import RxCocoa
import DesignSystem

// swiftlint:disable type_body_length
class ManageViewController: BaseVC<ManageViewModel> {
    private let roadData = PublishRelay<(BottomButtonType, TopButtonType)>()
    var bottomButtonType: BottomButtonType = .honor {
        didSet {
            roadData.accept((bottomButtonType, topButtonType))
            if topButtonType == .new {
                switch bottomButtonType {
                case .honor:
                    paymentTargetTableView.isHidden = true
                    cashPaymentTableView.isHidden = true
                    veteranNewcomerTableView.isHidden = false
                    spouseNewcomerTableView.isHidden = true
                    stoppageTableView.isHidden = true
                case .wife:
                    paymentTargetTableView.isHidden = true
                    cashPaymentTableView.isHidden = true
                    veteranNewcomerTableView.isHidden = true
                    spouseNewcomerTableView.isHidden = false
                    stoppageTableView.isHidden = true
                case .veteransAffairs:
                    paymentTargetTableView.isHidden = true
                    cashPaymentTableView.isHidden = true
                    veteranNewcomerTableView.isHidden = true
                    spouseNewcomerTableView.isHidden = true
                    stoppageTableView.isHidden = true
                }
            }
        }
    }
    var topButtonType: TopButtonType = .current {
        didSet {
            switch topButtonType {
            case .current:
                paymentTargetTableView.isHidden = false
                cashPaymentTableView.isHidden = true
                veteranNewcomerTableView.isHidden = true
                spouseNewcomerTableView.isHidden = true
                stoppageTableView.isHidden = true
            case .money:
                paymentTargetTableView.isHidden = true
                cashPaymentTableView.isHidden = false
                veteranNewcomerTableView.isHidden = true
                stoppageTableView.isHidden = true
                spouseNewcomerTableView.isHidden = true
            case .new:
                switch bottomButtonType {
                case .honor:
                    paymentTargetTableView.isHidden = true
                    cashPaymentTableView.isHidden = true
                    veteranNewcomerTableView.isHidden = false
                    spouseNewcomerTableView.isHidden = true
                    stoppageTableView.isHidden = true
                case .wife:
                    paymentTargetTableView.isHidden = true
                    cashPaymentTableView.isHidden = true
                    veteranNewcomerTableView.isHidden = true
                    spouseNewcomerTableView.isHidden = false
                    stoppageTableView.isHidden = true
                case .veteransAffairs:
                    paymentTargetTableView.isHidden = true
                    cashPaymentTableView.isHidden = true
                    veteranNewcomerTableView.isHidden = true
                    spouseNewcomerTableView.isHidden = true
                    stoppageTableView.isHidden = true
                }
            case .stop:
                paymentTargetTableView.isHidden = true
                cashPaymentTableView.isHidden = true
                veteranNewcomerTableView.isHidden = true
                spouseNewcomerTableView.isHidden = true
                stoppageTableView.isHidden = false
            }
            roadData.accept((bottomButtonType, topButtonType))
        }
    }
    private let titleLabel = UILabel().then {
        $0.text = "참전유공자 명예 수당 지급 대상자 조회"
        $0.textColor = .Colors.GrayScale.g90.color
        $0.font = UIFont.pretendard(.h1)
    }
    private let noticeLabel = UILabel().then {
        $0.text = "*셀을 터치하여 데이터를 바로 수정할 수 있습니다."
        $0.textColor = .Colors.System.red.color
        $0.font = .pretendard(.p2)
    }
    private let underLineSegmentedControl = UnderLineSegmentedControl(
        categoryTitleList: ["대상자 현황", "현금 지급", "신규자", "지급중지자"]
    )
    private let printButton = UIButton(type: .system).then {
        $0.setTitle("엑셀파일 출력", for: .normal)
        $0.setTitleColor(UIColor.color(.system(.white)), for: .normal)
        $0.backgroundColor = UIColor.color(.primary(.primary))
        $0.layer.cornerRadius = 8
    }
    private let uploadButton = UIButton(type: .system).then {
        $0.setTitle("엑셀파일 업로드", for: .normal)
        $0.setTitleColor(UIColor.color(.grayScale(.g70)), for: .normal)
        $0.backgroundColor = UIColor.color(.grayScale(.g10))
        $0.layer.cornerRadius = 8
    }
    // tableviews
    private let paymentTargetTableView = PaymentTargetTableView()
    private let cashPaymentTableView = CashPaymentTableView()
    private let veteranNewcomerTableView = VeteranNewcomerTableView()
    private let spouseNewcomerTableView = SpouseNewcomerTableView()
    private let stoppageTableView = StoppageTableView()

    private let buttonCollectionView = ButtonCollectionView().then {
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.color(.grayScale(.g20)).cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 24
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        buttonCollectionView.collectionView.collectionViewLayout.invalidateLayout()
    }

    override func configureVC() {
        self.buttonCollectionView.selectedIndex.subscribe(onNext: { [weak self] in
            self?.titleLabel.text = "\($0.rawValue) 지급 대상자 조회"
            self?.bottomButtonType = $0
        }).disposed(by: disposeBag)
        self.underLineSegmentedControl.selectedIndex.subscribe(onNext: { [weak self] in
            self?.topButtonType = $0
        })
        .disposed(by: disposeBag)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.roadData.accept((.honor, .current))
    }
// swiftlint: disable function_body_length
    override func bind() {
        let input = ManageViewModel.Input(
            viewAppear: roadData
        )
        let output = viewModel.transform(input)
        output.paymentTargetList
            .bind(to: self.paymentTargetTableView.dataTableView.rx.items(
                cellIdentifier: PaymentTargetTableViewCell.identifier,
                cellType: PaymentTargetTableViewCell.self
            )) { _, item, cell in
                cell.setupView(
                    serialNum: item.serialNum,
                    administrativeAddress: item.administrativeAddress,
                    affairsNum: item.affairsNum,
                    sin: item.sin,
                    name: item.name,
                    address: item.address,
                    depositType: item.depositType,
                    bankName: item.bankName,
                    accountOwner: item.accountOwner,
                    account: item.account,
                    sibi: item.sibi,
                    gubi: item.gubi,
                    note: item.note
                )
                cell.selectionStyle = .none
            }.disposed(by: disposeBag)
        output.cashPaymentList
            .bind(to: self.cashPaymentTableView.dataTableView.rx.items(
                cellIdentifier: CashPaymentTableViewCell.identifier,
                cellType: CashPaymentTableViewCell.self
            )) { _, item, cell in
                cell.setUpView(
                    serialNum: item.serialNum,
                    administrativeAddress: item.administrativeAddress,
                    affairsNum: item.affairsNum,
                    sin: item.sin,
                    name: item.name,
                    address: item.address,
                    depositType: item.depositType,
                    sibi: item.sibi,
                    gubi: item.gubi,
                    note: item.note
                )
                cell.selectionStyle = .none
            }.disposed(by: disposeBag)
        output.veteranNewcomerList
            .bind(to: self.veteranNewcomerTableView.dataTableView.rx.items(
                cellIdentifier: VeteranNewcomerTableViewCell.identifier,
                cellType: VeteranNewcomerTableViewCell.self
            )) { _, item, cell in
                cell.setupView(
                    number: item.serialNum,
                    warRegistrationNumber: item.registrationNum,
                    name: item.name,
                    residentRegistrationNumber: item.sin,
                    birthDay: item.birthDate,
                    postNumber: item.postAddress,
                    address: item.roadAddress,
                    phoneNumber: item.phoneNum,
                    bankName: item.bankName,
                    accountNumber: item.account,
                    accountHolderName: item.accountOwner,
                    moveInDate: item.moveInDate,
                    applicationDate: item.applicationDate,
                    applicationReason: item.applicationReason,
                    note: item.note
                )
                cell.selectionStyle = .none
            }.disposed(by: disposeBag)
        output.spouseNewcomerList
            .bind(to: self.spouseNewcomerTableView.dataTableView.rx.items(
                cellIdentifier: SpouseNewcomerTableViewCell.identifier,
                cellType: SpouseNewcomerTableViewCell.self
            )) { _, item, cell in
                cell.setupView(
                    number: item.serialNum,
                    veteransAffairsNumber: item.affairsNum,
                    applicantName: item.applicantName,
                    applicantResidentRegistrationNumber: item.applicantSin,
                    applicantPhoneNumber: item.applicantPhoneNum,
                    applicantPostNumber: item.applicantPostAddress,
                    applicantAddress: item.applicantRoadAddress,
                    administrativeBuilding: item.administrativeAddress,
                    warVeteranName: item.warName,
                    veteranResidentRegistrationNumber: item.veteranSin,
                    dateOfDeathOfVeteran: item.deathDate,
                    division: item.veteranName,
                    bankName: item.bankName,
                    depositorName: item.accountOwner,
                    accountNumber: item.account,
                    moveInDate: item.moveInDate,
                    applicationDate: item.applicationDate,
                    newApplicationReason: item.applicationReason,
                    note: item.note
                )
                cell.selectionStyle = .none
            }.disposed(by: disposeBag)
        output.stoppageList
            .bind(to: self.stoppageTableView.dataTableView.rx.items(
                cellIdentifier: StoppageTableViewCell.identifier,
                cellType: StoppageTableViewCell.self
            )) { _, item, cell in
                cell.setupView(
                    serialNum: item.serialNum,
                    administrativeAddress: item.administrativeAddress,
                    affairsNum: item.affairsNum,
                    sin: item.sin,
                    name: item.name,
                    address: item.address,
                    depositType: item.depositType,
                    bankName: item.bankName,
                    accountOwner: item.accountOwner,
                    account: item.account,
                    note: item.note,
                    stoppageReason: item.stoppageReason,
                    stoppageDate: item.stoppageDate,
                    moveInAddress: item.moveInAddress
                )
                cell.selectionStyle = .none
            }.disposed(by: disposeBag)
    }
// swiftlint: enable function_body_length

    override func addView() {
        [
            titleLabel,
            noticeLabel,
            underLineSegmentedControl,
            uploadButton,
            printButton,
            paymentTargetTableView,
            cashPaymentTableView,
            veteranNewcomerTableView,
            spouseNewcomerTableView,
            stoppageTableView,
            buttonCollectionView
        ].forEach { self.view.addSubview($0) }
    }
    // swiftlint:disable function_body_length
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(64)
            $0.top.equalToSuperview().inset(60)
        }
        noticeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(64)
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
        }
        underLineSegmentedControl.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(64)
            $0.height.equalTo(50)
            $0.trailing.equalTo(uploadButton.snp.leading).offset(-36)
        }
        uploadButton.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom).offset(34)
            $0.trailing.equalTo(printButton.snp.leading).offset(-14)
            $0.height.equalTo(40)
            $0.width.equalTo(137)
        }
        printButton.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom).offset(34)
            $0.trailing.equalToSuperview().inset(64)
            $0.height.equalTo(40)
            $0.width.equalTo(119)
        }
        paymentTargetTableView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(64)
            $0.top.equalTo(underLineSegmentedControl.snp.bottom).offset(36)
            $0.trailing.bottom.equalToSuperview()
        }
        cashPaymentTableView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(64)
            $0.top.equalTo(underLineSegmentedControl.snp.bottom).offset(36)
            $0.trailing.bottom.equalToSuperview()
        }
        veteranNewcomerTableView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(64)
            $0.top.equalTo(underLineSegmentedControl.snp.bottom).offset(36)
            $0.trailing.bottom.equalToSuperview()
        }
        spouseNewcomerTableView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(64)
            $0.top.equalTo(underLineSegmentedControl.snp.bottom).offset(36)
            $0.trailing.bottom.equalToSuperview()
        }
        stoppageTableView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(64)
            $0.top.equalTo(underLineSegmentedControl.snp.bottom).offset(36)
            $0.trailing.bottom.equalToSuperview()
        }
        buttonCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(25)
            $0.height.equalTo(100)
        }
    }
    // swiftlint:enable function_body_length
}
// swiftlint:enable type_body_length
