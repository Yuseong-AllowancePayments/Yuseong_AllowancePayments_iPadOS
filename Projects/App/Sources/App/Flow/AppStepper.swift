import Foundation
import RxCocoa
import RxFlow
import RxSwift

class AppStepper: Stepper {
    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    init() {}

    func readyToEmitSteps() {
        Observable.just(YuseongAllowanceStep.selectTypeIsRequired)
            .delay(RxTimeInterval.seconds(2), scheduler: MainScheduler.instance)
            .bind(to: steps)
            .disposed(by: disposeBag)
    }
}
