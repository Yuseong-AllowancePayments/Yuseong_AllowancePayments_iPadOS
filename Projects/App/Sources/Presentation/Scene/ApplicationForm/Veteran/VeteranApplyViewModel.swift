import Foundation
import RealmSwift
import RxSwift
import RxCocoa
import RxFlow

class VeteranApplyViewModel: BaseVM, Stepper {
    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()
    var insertResult = BehaviorRelay<Bool>(value: false)

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

    func readDistrict(_ postCode: String) -> String {
        do {
            let realm = try Realm()
            let data = realm.objects(AdministrativeDistrict.self).filter("postCode == '\(postCode)'")
            return Array(data).last?.zone ?? "행정동이 산출되지 않았습니다."
        } catch {
            return error.localizedDescription
        }
    }

    func insertData(_ data: VeteranNewComer) {
        do {
            let realm = try Realm()
            guard let newValue = realm.object(
                ofType: VeteranNewcomerTab.self,
                forPrimaryKey: data.registrationNum
            ) else { return }
            try realm.write {
                newValue.serialNum = data.serialNum
                newValue.name = data.name
                newValue.birthDate = data.birthDate
                newValue.sin = data.sin
                newValue.postAddress = data.postAddress
                newValue.roadAddress = data.roadAddress
                newValue.administrativeAddress = data.administrativeAddress
                newValue.phoneNum = data.phoneNum
                newValue.accountOwner = data.accountOwner
                newValue.bankName = data.bankName
                newValue.account = data.account
                newValue.moveInDate = data.moveInDate
                newValue.applicationDate = data.applicationDate
                newValue.applicationReason = data.applicationReason
                newValue.note = data.note
                realm.add(newValue)
            }
            insertResult.accept(true)

            insertResult.asObservable()
                .map { _ in YuseongAllowanceStep.selectTypeIsRequired }
                .bind(to: steps)
                .disposed(by: disposeBag)
        } catch {
            print("Error initialising new realm, \(error)")
            insertResult.accept(false)
        }
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
