import Foundation
import RealmSwift
import RxSwift
import RxCocoa
import RxFlow

class CourtesyApplyViewModel: BaseVM, Stepper {
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

    func insertData(_ data: NewCourtesyData) {
        do {
            let realm = try Realm()

            let address = realm.objects(AdministrativeDistrict.self).filter("postCode == '\(data.postAddress)'")
            let zone = Array(address).last?.zone ?? "행정동이 산출되지 않았습니다."

            let newValue = CourtesyNewcomerTab()
            newValue.serialNum = data.serialNum
            newValue.veteranType = data.veteranType
            newValue.affairsNum = data.affairsNum
            newValue.postAddress = data.postAddress
            newValue.roadAddress = data.roadAddress
            newValue.administrativeAddress = zone
            newValue.applicantName = data.applicantName
            newValue.birthDate = data.birthDate
            newValue.applicantSin = data.applicantSin
            newValue.gender = data.gender
            newValue.phoneNum = data.phoneNum
            newValue.bankName = data.bankName
            newValue.accountOwner = data.accountOwner
            newValue.account = data.account
            newValue.moveInDate = data.moveInDate
            newValue.relation = data.relation
            newValue.priority =  data.priority
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

struct NewCourtesyData {
    var serialNum: String = ""
    var veteranType: String = ""
    var affairsNum: String = ""
    var postAddress: String = ""
    var roadAddress: String = ""
    var administrativeAddress: String = ""
    var applicantName: String = ""
    var birthDate: String = ""
    var applicantSin: String = ""
    var gender: String = ""
    var phoneNum: String = ""
    var bankName: String = ""
    var accountOwner: String = ""
    var account: String = ""
    var moveInDate: String = ""
    var relation: String = ""
    var priority: String = ""
    var applicationDate: String = ""
    var applicationReason: String = ""
    var note: String = ""
}
