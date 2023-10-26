import Foundation
import RxSwift
import RxCocoa
import RxFlow

class SelectTypeViewModel: BaseVM, Stepper {
    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    struct Input {
        let managerSignInButtonDidTap: Signal<Void>
        let nextButtonDidTap: Signal<Void>
        let selectType: BehaviorRelay<String>
    }
    struct Output {
    }

    func transform(_ input: Input) -> Output {
        input.managerSignInButtonDidTap.asObservable()
            .map { YuseongAllowanceStep.managerSignInIsRequired }
            .bind(to: steps)
            .disposed(by: disposeBag)
        input.nextButtonDidTap.asObservable()
            .map { YuseongAllowanceStep.applyIsRequired(selectType: input.selectType.value) }
            .bind(to: steps)
            .disposed(by: disposeBag)
        return Output()
    }
}
