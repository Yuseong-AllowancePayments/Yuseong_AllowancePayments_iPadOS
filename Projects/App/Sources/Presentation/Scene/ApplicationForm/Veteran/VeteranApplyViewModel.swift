import Foundation
import RealmSwift
import RxSwift
import RxCocoa
import RxFlow

class VeteranApplyViewModel: BaseVM, Stepper {
    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()
    var data = VeteranNewComer()

    struct Input {
        let backButtonDidTap: Signal<Void>
        let finishButtonDidTap: Signal<Void>
    }
    struct Output {
    }

    func transform(_ input: Input) -> Output {
        input.backButtonDidTap.asObservable()
            .map { YuseongAllowanceStep.selectTypeIsRequired }
            .bind(to: steps)
            .disposed(by: disposeBag)
        input.finishButtonDidTap.asObservable()
            .map { YuseongAllowanceStep.selectTypeIsRequired }
            .bind(to: steps)
            .disposed(by: disposeBag)
        return Output()
    }
}

public struct VeteranNewComer {
    var serialNum: String = ""
    var name: String = ""
    var birthDate: String = ""
    var sin: String = ""
    var registrationNum: String = ""
    var postAddress: String = ""
    var roadAddress: String = ""
    var administrativeAddress: String = ""
    var phoneNum: String = ""
    var accountOwner: String = ""
    var bankName: String = ""
    var account: String = ""
    var moveInDate: String = ""
    var applicationDate: String = ""
    var applicationReason: String = ""
    var note: String = ""
}
