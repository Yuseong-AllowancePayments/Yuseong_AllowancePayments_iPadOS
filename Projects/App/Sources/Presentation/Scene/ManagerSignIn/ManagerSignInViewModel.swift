import Foundation
import RxSwift
import RxCocoa
import RxFlow

class ManagerSignInViewModel: BaseVM, Stepper {
    let steps = PublishRelay<Step>()
    private var disposeBag = DisposeBag()

    struct Input {
        let isSucceedVerification: PublishRelay<Bool>
    }
    struct Output {
    }

    func transform(_ input: Input) -> Output {
        input.isSucceedVerification.asObservable()
            .map { _ in YuseongAllowanceStep.manageIsRequired }
            .bind(to: steps)
            .disposed(by: disposeBag)
        return Output()
    }
}
