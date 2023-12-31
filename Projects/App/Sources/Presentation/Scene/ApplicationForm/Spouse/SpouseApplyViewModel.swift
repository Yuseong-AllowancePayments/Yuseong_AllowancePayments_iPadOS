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

    func insertData(_ data: NewSpouseData) {
        do {
            let realm = try Realm()

            let address = realm.objects(AdministrativeDistrict.self).filter("postCode == '\(data.applicantPostAddress)'")
            let zone = Array(address).last?.zone ?? "행정동이 산출되지 않았습니다."

            let newValue = SpouseNewcomerTab()
            newValue.serialNum = data.serialNum
            newValue.applicantName = data.applicantName
            newValue.applicantSin = data.applicantSin
            newValue.applicantPostAddress = data.applicantPostAddress
            newValue.applicantRoadAddress = data.applicantRoadAddress
            newValue.administrativeAddress = zone
            newValue.veteranName = data.veteranName
            newValue.warName = data.warName
            newValue.veteranSin = data.veteranSin
            newValue.affairsNum = data.affairsNum
            newValue.deathDate = data.deathDate
            newValue.bankName = data.bankName
            newValue.accountOwner = data.accountOwner
            newValue.account = data.account
            newValue.applicationDate = data.applicationDate
            newValue.applicationReason = data.applicationReason
            newValue.moveInDate = data.moveInDate
            newValue.note = data.note

            try realm.write {
                realm.add(newValue)
            }
        } catch {
            print("Error initialising new realm, \(error)")
        }
    }
}

struct NewSpouseData {
    var serialNum: String = ""
    var applicantName: String = ""
    var applicantSin: String = ""
    var applicantPostAddress: String = ""
    var applicantRoadAddress: String = ""
    var administrativeAddress: String = ""
    var veteranName: String = ""
    var warName: String = ""
    var veteranSin: String = ""
    var affairsNum: String = ""
    var deathDate: String = ""
    var bankName: String = ""
    var accountOwner: String = ""
    var account: String = ""
    var applicationDate: String = ""
    var applicationReason: String = ""
    var moveInDate: String = ""
    var note: String = ""
}
