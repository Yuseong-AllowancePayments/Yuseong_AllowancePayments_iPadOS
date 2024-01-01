import Foundation
import RealmSwift
import RxSwift
import RxCocoa
import RxFlow

class VeteranApplyViewModel: BaseVM, Stepper {
    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    struct Input {
        let backButtonDidTap: Signal<Void>
        let finishButtonDidTap: Driver<Void>
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

    func insertData(_ data: NewVeteranData) {
        do {
            let realm = try Realm()

            let address = realm.objects(AdministrativeDistrict.self).filter("postCode == '\(data.postAddress)'")
            let zone = Array(address).last?.zone ?? "행정동이 산출되지 않았습니다."

            let newValue = VeteranNewcomerTab()
            newValue.serialNum = data.serialNum
            newValue.name = data.name
            newValue.birthDate = data.birthDate
            newValue.sin = data.sin
            newValue.registrationNum = data.registrationNum
            newValue.postAddress = data.postAddress
            newValue.roadAddress = data.roadAddress
            newValue.administrativeAddress = zone
            newValue.phoneNum = data.phoneNum
            newValue.accountOwner = data.accountOwner
            newValue.bankName = data.bankName
            newValue.account = data.account
            newValue.moveInDate = data.moveInDate
            newValue.applicationDate = data.applicationDate
            newValue.applicationReason = data.applicationReason
            newValue.note = data.note

            try realm.write {
                realm.add(newValue)
            }
        } catch {
            print("Error initialising new realm, \(error)")
        }
    }
}

struct NewVeteranData {
    var serialNum: String = ""
    var name: String = ""
    var birthDate: String = ""
    var sin: String = ""
    var registrationNum: String = ""
    var postAddress: String = ""
    var roadAddress: String = ""
    var administrativeAddress: String = ""
    var phoneNum: String = ""
    var bankName: String = ""
    var accountOwner: String = ""
    var account: String = ""
    var applicationDate: String = ""
    var applicationReason: String = ""
    var moveInDate: String = ""
    var note: String = ""
}
