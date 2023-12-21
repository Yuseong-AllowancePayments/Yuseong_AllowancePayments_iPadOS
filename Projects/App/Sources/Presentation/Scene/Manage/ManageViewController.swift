import UIKit
import RxFlow
import SnapKit
import Then
import RxSwift
import RxCocoa
import DesignSystem

class ManageViewController: BaseVC<ManageViewModel> {
    var bottomButtonType: BottomButtonType = .honor {
        didSet {
            dataTableView.reloadData()
        }
    }
    var topButtonType: TopButtonType = .current {
        didSet {
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

    private let dataTableView = UITableView(frame: .zero, style: .plain).then {
        $0.rowHeight = 56
        $0.register(DefaultDataTableViewCell.self, forCellReuseIdentifier: DefaultDataTableViewCell.identifier)
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
        $0.tableFooterView = .init(frame: .init(x: 0, y: 0, width: 0, height: 120))
        $0.sectionHeaderHeight = 56
        $0.register(
            DefaultHeaderFooterView.self,
            forHeaderFooterViewReuseIdentifier: DefaultHeaderFooterView.identifier
        )
        $0.register(
            HonorHeaderFooterView.self,
            forHeaderFooterViewReuseIdentifier: HonorHeaderFooterView.identifier
        )
        $0.sectionHeaderTopPadding = 0
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
            print($0)
        }).disposed(by: disposeBag)
        self.underLineSegmentedControl.selectedIndex.subscribe(onNext: { [weak self] in
            self?.topButtonType = $0
            print($0)
        })
        .disposed(by: disposeBag)
    }
    override func bind() {
        print(bottomButtonType)
        print(topButtonType)
        dataTableView.dataSource = self
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

extension ManageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DefaultDataTableViewCell.identifier,
            for: indexPath
        ) as? DefaultDataTableViewCell else { return UITableViewCell() }
        cell.setupView(
            number: "9999",
            administrativeBuilding: "lorem ipsumdollar",
            veteransAffairsNumber: "0",
            name: "홍길동",
            residentNumber: "999999-9999999",
            address: "부산시 해운대구 뭐시기뭐시기뭐시기뭐시기"
        )
        cell.selectionStyle = .none
        return cell
    }
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
                    withIdentifier: DefaultHeaderFooterView.identifier
                ) as? DefaultHeaderFooterView else {
                    return UIView()
                }
                currentWidth = 1080
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
