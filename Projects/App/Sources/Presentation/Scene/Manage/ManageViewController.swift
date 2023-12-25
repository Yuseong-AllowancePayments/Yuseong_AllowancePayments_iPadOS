import UIKit
import RxFlow
import SnapKit
import Then
import RxSwift
import RxCocoa
import DesignSystem

class ManageViewController: BaseVC<ManageViewModel> {
    private let roadData = PublishRelay<(BottomButtonType, TopButtonType)>()
    var bottomButtonType: BottomButtonType = .honor {
        didSet {
            roadData.accept((bottomButtonType, topButtonType))
            dataTableView.reloadData()
        }
    }
    var topButtonType: TopButtonType = .current {
        didSet {
            roadData.accept((bottomButtonType, topButtonType))
            dataTableView.reloadData()
        }
    }
    var currentWidth = 1080 {
        didSet {
            contentView.snp.remakeConstraints {
                $0.edges.equalTo(scrollView.contentLayoutGuide)
                $0.height.equalToSuperview()
                $0.width.equalTo(currentWidth)
            }
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
    private let scrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
    }
    private let contentView = UIView().then {
        $0.backgroundColor = .white
    }
    private let dataTableView = DataTableView().then {
        $0.register(DefaultDataTableViewCell.self, forCellReuseIdentifier: DefaultDataTableViewCell.identifier)
        $0.register(HonoerDataTableViewCell.self, forCellReuseIdentifier: HonoerDataTableViewCell.identifier)
        $0.register(WifeDataTableViewCell.self, forCellReuseIdentifier: WifeDataTableViewCell.identifier)
        $0.register(
            DefaultHeaderFooterView.self,
            forHeaderFooterViewReuseIdentifier: DefaultHeaderFooterView.identifier
        )
        $0.register(
            HonorHeaderFooterView.self,
            forHeaderFooterViewReuseIdentifier: HonorHeaderFooterView.identifier
        )
        $0.register(
            WifeHeaderFooterView.self,
            forHeaderFooterViewReuseIdentifier: WifeHeaderFooterView.identifier
        )
    }
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

    override func bind() {
        let input = ManageViewModel.Input(
            viewAppear: roadData
        )
        let output = viewModel.transform(input)
        output.veteranPaymentTargetList
            .bind(to: self.dataTableView.rx.items(
                cellIdentifier: DefaultDataTableViewCell.identifier,
                cellType: DefaultDataTableViewCell.self
            )) { row, item, cell in
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
        output.veteranNewcomerList
            .bind(to: self.dataTableView.rx.items(
                cellIdentifier: HonoerDataTableViewCell.identifier,
                cellType: HonoerDataTableViewCell.self
            )) { row, item, cell in
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
        dataTableView.delegate = self
    }

    override func addView() {
        [
            titleLabel,
            noticeLabel,
            underLineSegmentedControl,
            uploadButton,
            printButton,
            scrollView,
            buttonCollectionView
        ].forEach { self.view.addSubview($0) }
        scrollView.addSubview(contentView)
        [
            dataTableView
        ].forEach { contentView.addSubview($0) }
        scrollView.contentSize = contentView.frame.size
    }

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
        scrollView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(64)
            $0.top.equalTo(underLineSegmentedControl.snp.bottom).offset(36)
            $0.trailing.bottom.equalToSuperview()
        }
        contentView.snp.updateConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.height.equalToSuperview()
            $0.width.equalTo(currentWidth)
        }
        dataTableView.snp.updateConstraints {
            $0.edges.equalToSuperview()
        }
        buttonCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(25)
            $0.height.equalTo(100)
        }
    }
}

extension ManageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if topButtonType == .new {
            switch bottomButtonType {
            case .honor:
                guard let header = tableView.dequeueReusableHeaderFooterView(
                    withIdentifier: HonorHeaderFooterView.identifier
                ) as? HonorHeaderFooterView else {
                    return UIView()
                }
                currentWidth = 2550
                return header
            case .veteransAffairs:
                guard let header = tableView.dequeueReusableHeaderFooterView(
                    withIdentifier: DefaultHeaderFooterView.identifier
                ) as? DefaultHeaderFooterView else {
                    return UIView()
                }
                currentWidth = 1080
                return header
            case .wife:
                guard let header = tableView.dequeueReusableHeaderFooterView(
                    withIdentifier: WifeHeaderFooterView.identifier
                ) as? WifeHeaderFooterView else {
                    return UIView()
                }
                currentWidth = 3250
                return header
            }
        } else {
            guard let header = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: DefaultHeaderFooterView.identifier
            ) as? DefaultHeaderFooterView else {
                return UIView()
            }
            currentWidth = 1080
            return header
        }
    }
}
