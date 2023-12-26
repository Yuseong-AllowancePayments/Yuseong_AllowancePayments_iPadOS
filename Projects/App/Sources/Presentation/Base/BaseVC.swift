import UIKit
import RxSwift
import DesignSystem

class BaseVC<ViewModel>: UIViewController {
    var viewModel: ViewModel
    var disposeBag: DisposeBag = DisposeBag()

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configureVC()
        bind()
        addView()
        setLayout()
    }
    override func viewWillLayoutSubviews() {
    }

    func configureVC() {}
    func bind() {}
    func addView() {}
    func setLayout() {}
}
