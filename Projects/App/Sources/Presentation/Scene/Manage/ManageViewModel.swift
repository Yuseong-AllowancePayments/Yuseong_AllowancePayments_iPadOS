import Foundation
import RxSwift
import RxCocoa
import RxFlow
import RealmSwift

class ManageViewModel: BaseVM, Stepper {
    let steps = PublishRelay<Step>()
    private var disposeBag = DisposeBag()
    struct Input {
        let viewAppear: PublishRelay<(BottomButtonType, TopButtonType)>
    }
    struct Output {
        let paymentTargetList: BehaviorRelay<[PaymentTargetTab]>
        let cashPaymentList: BehaviorRelay<[CashPaymentTab]>
        let veteranNewcomerList: BehaviorRelay<[VeteranNewcomerTab]>
        let spouseNewcomerList: BehaviorRelay<[SpouseNewcomerTab]>
        let courtesyNewcomerList: BehaviorRelay<[CourtesyNewcomerTab]>
        let stoppageList: BehaviorRelay<[StoppageTab]>
    }
// swiftlint: disable function_body_length
    func transform(_ input: Input) -> Output {
        let paymentTargetList = BehaviorRelay<[PaymentTargetTab]>(value: [])
        let cashPaymentList = BehaviorRelay<[CashPaymentTab]>(value: [])
        let veteranNewcomerList = BehaviorRelay<[VeteranNewcomerTab]>(value: [])
        let spouseNewcomerList = BehaviorRelay<[SpouseNewcomerTab]>(value: [])
        let courtesyNewcomerList = BehaviorRelay<[CourtesyNewcomerTab]>(value: [])
        let stoppageList = BehaviorRelay<[StoppageTab]>(value: [])
        input.viewAppear.asObservable()
            .subscribe(onNext: {
                do {
                    let realm = try Realm()
                    switch $0.1 {
                    case .current:
                        var list: [PaymentTargetTab] = []
                        switch $0.0 {
                        case .honor:
                            realm.objects(VeteranPaymentTargetTab.self).forEach {
                                list.append($0.toPaymentTarget())
                            }
                        case .veteransAffairs:
                            realm.objects(CourtesyPaymentTargetTab.self).forEach {
                                list.append($0.toPaymentTarget())
                            }
                        case .wife:
                            realm.objects(SpousePaymentTargetTab.self).forEach {
                                list.append($0.toPaymentTarget())
                            }
                        }
                        paymentTargetList.accept(list)
                        print(list)
                    case .money:
                        var list: [CashPaymentTab] = []
                        switch $0.0 {
                        case .honor:
                            realm.objects(VeteranCashPaymentTab.self).forEach {
                                list.append($0.toCashPayment())
                            }
                        case .veteransAffairs:
                            realm.objects(CourtesyCashPaymentTab.self).forEach {
                                list.append($0.toCashPayment())
                            }
                        case .wife:
                            realm.objects(SpouseCashPaymentTab.self).forEach {
                                list.append($0.toCashPayment())
                            }
                        }
                        cashPaymentList.accept(list)
                        print(list)
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
                        var list: [StoppageTab] = []
                        switch $0.0 {
                        case .honor:
                            realm.objects(VeteranStoppageTab.self).forEach {
                                list.append($0.toStoppage())
                            }
                        case .veteransAffairs:
                            realm.objects(CourtesyStoppageTab.self).forEach {
                                list.append($0.toStoppage())
                            }
                        case .wife:
                            realm.objects(SpouseStoppageTab.self).forEach {
                                list.append($0.toStoppage())
                            }
                        }
                        stoppageList.accept(list)
                        print(list)
                    }
                } catch {
                    print("Error initialising new realm, \(error)")
                }
            }).disposed(by: disposeBag)
        return Output(
            paymentTargetList: paymentTargetList,
            cashPaymentList: cashPaymentList,
            veteranNewcomerList: veteranNewcomerList,
            spouseNewcomerList: spouseNewcomerList,
            courtesyNewcomerList: courtesyNewcomerList,
            stoppageList: stoppageList
        )
    }
}
// swiftlint: enable function_body_length
