import UIKit
import RxSwift
import RxCocoa

open class BaseVC: UIViewController {
    let disposeBag = DisposeBag()
    let bound = UIScreen.main.bounds

    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
        setLayout()
        configureVC()
        bind()
    }
    // swiftlint:disable unneeded_override
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    // swiftlint:enable unneeded_override

    func addView() {}
    func setLayout() {}
    func configureVC() {}
    func bind() {}
}
