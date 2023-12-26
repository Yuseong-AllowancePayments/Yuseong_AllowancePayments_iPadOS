import Foundation
import RealmSwift
import RxSwift
import RxCocoa
import RxFlow

class SpouseApplyViewModel: BaseVM, Stepper {
    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

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
            .subscribe(onNext: {
                do {
                    let realm = try Realm()
                    try realm.write {
                        let data = realm.create(SpouseNewcomerTab.self)
//                        data.serialNum =
//                        data.applicantName =
//                        data.applicantSin =
//                        data.applicantPhoneNum
//                        data.applicantPostAddress
//                        data.applicantRoadAddress
//                        data.administrativeAddress
//                        data.veteranName
//                        data.warName
//                        data.veteranSin
//                        data.deathDate
//                        data.accountOwner
//                        data.account
//                        data.moveInDate
//                        data.applicationDate
//                        data.applicationReason
//                        data.note
                        realm.add(data)
                    }
                } catch {
                    print("Error initialising new realm, \(error)")
                }
            }).disposed(by: disposeBag)
        return Output()
    }
}
