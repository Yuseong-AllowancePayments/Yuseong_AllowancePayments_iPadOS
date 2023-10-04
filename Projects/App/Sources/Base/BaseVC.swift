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
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    func addView() {}
    func setLayout() {}
    func configureVC() {}
    func bind() {}
}
