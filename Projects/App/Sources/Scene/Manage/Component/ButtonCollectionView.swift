import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa
import DesignSystem

final class ButtonCollectionView: UIView {
    private var categoryTitleList: [String]

    let selectedIndex = PublishSubject<Int>()

    let itemSelected = PublishSubject<IndexPath>()

    private let disposeBag = DisposeBag()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let inset: CGFloat = 0.0
        layout.minimumLineSpacing = 12.0
        layout.minimumInteritemSpacing = 0.0
        layout.sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(ButtonCollectionViewCell.self,
                                forCellWithReuseIdentifier: ButtonCollectionViewCell.identifier)

        collectionView.isScrollEnabled = true
        Observable.just(categoryTitleList)
            .bind(to: collectionView.rx.items(
                cellIdentifier: ButtonCollectionViewCell.identifier,
                cellType: ButtonCollectionViewCell.self
            )) { _, title, cell in
                cell.setupView(title: title)
            }.disposed(by: disposeBag)

        collectionView.rx.itemSelected
            .bind(to: self.itemSelected)
            .disposed(by: self.disposeBag)

        return collectionView
    }()

    init() {
        self.categoryTitleList = ["참전유공자 명예 수당", "참전유공자 배우자 수당", "보훈 예우 수당"]
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
                self?.selectedIndex.onNext(indexPath.row)
            }).disposed(by: self.disposeBag)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ButtonCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.325, height: 76)
    }
}

private extension ButtonCollectionView {
    func setupLayout() {
        [
            collectionView
        ].forEach { addSubview($0) }
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(12)
        }
    }
}
