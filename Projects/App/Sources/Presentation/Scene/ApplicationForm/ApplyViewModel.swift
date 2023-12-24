import Foundation
import RealmSwift
import RxSwift
import RxCocoa
import RxFlow

class ApplyViewModel: BaseVM, Stepper {
    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()
//    private let realm = try! Realm()

    struct Input {
        let backButtonDidTap: Signal<Void>
    }
    struct Output {
    }

    func transform(_ input: Input) -> Output {
        input.backButtonDidTap.asObservable()
            .map { YuseongAllowanceStep.selectTypeIsRequired }
            .bind(to: steps)
            .disposed(by: disposeBag)
        return Output()
    }

//    func insertData(_ data: Object) {
//        let realm = try! Realm()
//    }
}
