import Foundation
import RxSwift
import RxCocoa
import RxFlow
import RealmSwift
// swiftlint:disable force_try
class ManageViewModel: BaseVM, Stepper {
    let steps = PublishRelay<Step>()
    private var disposeBag = DisposeBag()
    struct Input {
        let viewAppear: PublishRelay<(BottomButtonType, TopButtonType)>
    }
    struct Output {
        let veteranPaymentTargetList: BehaviorRelay<[VeteranPaymentTargetTab]>
        let veteranCashPaymentList: BehaviorRelay<[VeteranCashPaymentTab]>
        let veteranNewcomerList: BehaviorRelay<[VeteranNewcomerTab]>
        let veteranStoppageList: BehaviorRelay<[VeteranStoppageTab]>
        let spousePaymentTargetList: BehaviorRelay<[SpousePaymentTargetTab]>
        let spouseCashPaymentList: BehaviorRelay<[SpouseCashPaymentTab]>
        let spouseNewcomerList: BehaviorRelay<[SpouseNewcomerTab]>
        let spouseStoppageList: BehaviorRelay<[SpouseStoppageTab]>
        let courtesyPaymentTargetList: BehaviorRelay<[CourtesyPaymentTargetTab]>
        let courtesyCashPaymentList: BehaviorRelay<[CourtesyCashPaymentTab]>
        let courtesyNewcomerList: BehaviorRelay<[CourtesyNewcomerTab]>
        let courtesyStoppageList: BehaviorRelay<[CourtesyStoppageTab]>
    }
// swiftlint: disable function_body_length
    func transform(_ input: Input) -> Output {
        var veteranPaymentTargetList = BehaviorRelay<[VeteranPaymentTargetTab]>(value: [])
        var veteranCashPaymentList = BehaviorRelay<[VeteranCashPaymentTab]>(value: [])
        var veteranNewcomerList = BehaviorRelay<[VeteranNewcomerTab]>(value: [])
        var veteranStoppageList = BehaviorRelay<[VeteranStoppageTab]>(value: [])
        var spousePaymentTargetList = BehaviorRelay<[SpousePaymentTargetTab]>(value: [])
        var spouseCashPaymentList = BehaviorRelay<[SpouseCashPaymentTab]>(value: [])
        var spouseNewcomerList = BehaviorRelay<[SpouseNewcomerTab]>(value: [])
        var spouseStoppageList = BehaviorRelay<[SpouseStoppageTab]>(value: [])
        var courtesyPaymentTargetList = BehaviorRelay<[CourtesyPaymentTargetTab]>(value: [])
        var courtesyCashPaymentList = BehaviorRelay<[CourtesyCashPaymentTab]>(value: [])
        var courtesyNewcomerList = BehaviorRelay<[CourtesyNewcomerTab]>(value: [])
        var courtesyStoppageList = BehaviorRelay<[CourtesyStoppageTab]>(value: [])
        input.viewAppear.asObservable()
            .subscribe(onNext: {
                do {
                    let realm = try Realm()
                    switch $0.1 {
                    case .current:
                        switch $0.0 {
                        case .honor:
                            var list: [VeteranPaymentTargetTab] = []
                            realm.objects(VeteranPaymentTargetTab.self).forEach {
                                list.append($0)
                            }
                            veteranPaymentTargetList.accept(list)
                            print(list)
                        case .veteransAffairs:
                            var list: [CourtesyPaymentTargetTab] = []
                            realm.objects(CourtesyPaymentTargetTab.self).forEach {
                                list.append($0)
                            }
                            courtesyPaymentTargetList.accept(list)
                            print(list)
                        case .wife:
                            var list: [SpousePaymentTargetTab] = []
                            realm.objects(SpousePaymentTargetTab.self).forEach {
                                list.append($0)
                            }
                            spousePaymentTargetList.accept(list)
                            print(list)
                        }
                    case .money:
                        switch $0.0 {
                        case .honor:
                            var list: [VeteranCashPaymentTab] = []
                            realm.objects(VeteranCashPaymentTab.self).forEach {
                                list.append($0)
                            }
                            veteranCashPaymentList.accept(list)
                            print(list)
                        case .veteransAffairs:
                            var list: [CourtesyCashPaymentTab] = []
                            realm.objects(CourtesyCashPaymentTab.self).forEach {
                                list.append($0)
                            }
                            courtesyCashPaymentList.accept(list)
                            print(list)
                        case .wife:
                            var list: [SpouseCashPaymentTab] = []
                            realm.objects(SpouseCashPaymentTab.self).forEach {
                                list.append($0)
                            }
                            spouseCashPaymentList.accept(list)
                            print(list)
                        }
                    case .new:
                        switch $0.0 {
                        case .honor:
                            var list: [VeteranNewcomerTab] = []
                            realm.objects(VeteranNewcomerTab.self).forEach {
                                list.append($0)
                            }
                            veteranNewcomerList.accept(list)
                            print(list)
                        case .veteransAffairs:
                            var list: [CourtesyNewcomerTab] = []
                            realm.objects(CourtesyNewcomerTab.self).forEach {
                                list.append($0)
                            }
                            courtesyNewcomerList.accept(list)
                            print(list)
                        case .wife:
                            var list: [SpouseNewcomerTab] = []
                            realm.objects(SpouseNewcomerTab.self).forEach {
                                list.append($0)
                            }
                            spouseNewcomerList.accept(list)
                            print(list)
                        }
                    case .stop:
                        switch $0.0 {
                        case .honor:
                            var list: [VeteranStoppageTab] = []
                            realm.objects(VeteranStoppageTab.self).forEach {
                                list.append($0)
                            }
                            veteranStoppageList.accept(list)
                            print(list)
                        case .veteransAffairs:
                            var list: [CourtesyStoppageTab] = []
                            realm.objects(CourtesyStoppageTab.self).forEach {
                                list.append($0)
                            }
                            courtesyStoppageList.accept(list)
                            print(list)
                        case .wife:
                            var list: [SpouseStoppageTab] = []
                            realm.objects(SpouseStoppageTab.self).forEach {
                                list.append($0)
                            }
                            spouseStoppageList.accept(list)
                            print(list)
                        }
                    }
                } catch {
                    print("Error initialising new realm, \(error)")
                }
            }).disposed(by: disposeBag)
        return Output(
            veteranPaymentTargetList: veteranPaymentTargetList,
            veteranCashPaymentList: veteranCashPaymentList,
            veteranNewcomerList: veteranNewcomerList,
            veteranStoppageList: veteranStoppageList,
            spousePaymentTargetList: spousePaymentTargetList,
            spouseCashPaymentList: spouseCashPaymentList,
            spouseNewcomerList: spouseNewcomerList,
            spouseStoppageList: spouseStoppageList,
            courtesyPaymentTargetList: courtesyPaymentTargetList,
            courtesyCashPaymentList: courtesyCashPaymentList,
            courtesyNewcomerList: courtesyNewcomerList,
            courtesyStoppageList: courtesyStoppageList
        )
    }
}
// swiftlint:enable force_try
// swiftlint: enable function_body_length
