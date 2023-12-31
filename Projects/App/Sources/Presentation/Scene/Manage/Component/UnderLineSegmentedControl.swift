import UIKit
import RxSwift
import RxCocoa
import Then
import SnapKit
import DesignSystem

enum TopButtonType {
    case current
    case money
    case new
    case stop
}

final class UnderLineSegmentedControl: UIView {

    private var categoryTitleList: [String]

    let selectedIndex = PublishRelay<TopButtonType>()

    let itemSelected = PublishSubject<IndexPath>()

    private let disposeBag = DisposeBag()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let inset: CGFloat = 0.0
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 30.0
        layout.sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(UnderLineSegmentedControlCell.self,
                                forCellWithReuseIdentifier: UnderLineSegmentedControlCell.identifier)

        collectionView.isScrollEnabled = true
        Observable.just(categoryTitleList)
            .bind(to: collectionView.rx.items(
                cellIdentifier: UnderLineSegmentedControlCell.identifier,
                cellType: UnderLineSegmentedControlCell.self
            )) { _, title, cell in
                cell.setupView(title: title)
            }.disposed(by: disposeBag)

        collectionView.rx.itemSelected
            .bind(to: self.itemSelected)
            .disposed(by: self.disposeBag)

        return collectionView
    }()

    private let underLineView = UIView().then {
        $0.backgroundColor = .color(.grayScale(.g20))
    }

    init(categoryTitleList: [String]) {
        self.categoryTitleList = categoryTitleList
        super.init(frame: .zero)
        collectionView.delegate = self
        setupLayout()
        self.collectionView.selectItem(
            at: IndexPath(row: 0, section: 0),
            animated: true,
            scrollPosition: []
        )
        collectionView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                switch indexPath.row {
                case 0:
                    self?.selectedIndex.accept(.current)
                case 1:
                    self?.selectedIndex.accept(.money)
                case 2:
                    self?.selectedIndex.accept(.new)
                case 3:
                    self?.selectedIndex.accept(.stop)
                default:
                    self?.selectedIndex.accept(.current)
                }
            }).disposed(by: self.disposeBag)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UnderLineSegmentedControl: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let label = UILabel().then {
            $0.font = UIFont.pretendard(.h4)
            $0.text = categoryTitleList[indexPath.row]
            $0.sizeToFit()
        }
        let size = label.frame.size
        return CGSize(width: size.width, height: 50)
    }
}
private extension UnderLineSegmentedControl {
    func setupLayout() {
        [
            underLineView,
            collectionView
        ].forEach { addSubview($0) }
        underLineView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
