import Foundation
import RealmSwift

final class LocalData: Object {
    @Persisted var veteranTable: VeteranTable
    @Persisted var spouseTable: SpouseTable
    @Persisted var courtesyTable: CourtesyTable
}

class VeteranTable: Object {
    @Persisted var paymentTargetTab: List<VeteranPaymentTargetTab>
    @Persisted var cashPaymentTab: List<VeteranCashPaymentTab>
    @Persisted var newComerVeteranTab: List<VeteranNewcomerTab>
    @Persisted var stoppageTab: List<VeteranStoppageTab>
}

class SpouseTable: Object {
    @Persisted var paymentTargetTab: List<SpousePaymentTargetTab>
    @Persisted var cashpaymentTab: List<SpouseCashPaymentTab>
    @Persisted var newComerSpouseTab: List<SpouseNewcomerTab>
    @Persisted var stoppageTab: List<SpouseStoppageTab>
}

class CourtesyTable: Object {
    @Persisted var paymentTargetTab: List<CourtesyPaymentTargetTab>
    @Persisted var cashpaymentTab: List<CourtesyCashPaymentTab>
    @Persisted var newComerCourtesyTab: List<CourtesyNewcomerTab>
    @Persisted var stoppageTab: List<CourtesyStoppageTab>
}

class VeteranPaymentTargetTab: Object {
    @Persisted var serialNum: String = ""
    @Persisted var administrativeAddress: String = ""
    @Persisted var affairsNum: String = ""
    @Persisted(primaryKey: true) var sin: String = ""
    @Persisted var name: String = ""
    @Persisted var address: String = ""
    @Persisted var depositType: String = ""
    @Persisted var bankName: String = ""
    @Persisted var accountOwner: String = ""
    @Persisted var account: String = ""
    @Persisted var sibi: String = ""
    @Persisted var gubi: String = ""
    @Persisted var note: String = ""
}

class VeteranCashPaymentTab: Object {
    @Persisted var serialNum: String = ""
    @Persisted var administrativeAddress: String = ""
    @Persisted var affairsNum: String = ""
    @Persisted(primaryKey: true) var sin: String = ""
    @Persisted var name: String = ""
    @Persisted var address: String = ""
    @Persisted var depositType: String = ""
    @Persisted var sibi: String = ""
    @Persisted var gubi: String = ""
    @Persisted var note: String = ""
}

class VeteranNewcomerTab: Object {
    @Persisted var serialNum: String = ""
    @Persisted var name: String = ""
    @Persisted var birthDate: String = ""
    @Persisted var sin: String = ""
    @Persisted(primaryKey: true) var registrationNum: String = ""
    @Persisted var postAddress: String = ""
    @Persisted var roadAddress: String = ""
    @Persisted var administrativeAddress: String = ""
    @Persisted var phoneNum: String = ""
    @Persisted var accountOwner: String = ""
    @Persisted var bankName: String = ""
    @Persisted var account: String = ""
    @Persisted var moveInDate: String = ""
    @Persisted var applicationDate: String = ""
    @Persisted var applicationReason: String = ""
    @Persisted var note: String = ""
}

class VeteranStoppageTab: Object {
    @Persisted var serialNum: String = ""
    @Persisted var administrativeAddress: String = ""
    @Persisted var affairsNum: String = ""
    @Persisted(primaryKey: true) var sin: String = ""
    @Persisted var name: String = ""
    @Persisted var address: String = ""
    @Persisted var depositType: String = ""
    @Persisted var bankName: String = ""
    @Persisted var accountOwner: String = ""
    @Persisted var account: String = ""
    @Persisted var note: String = ""
    @Persisted var stoppageReason: String = ""
    @Persisted var stoppageDate: String = ""
    @Persisted var moveInAddress: String = ""
}

class SpousePaymentTargetTab: Object {
    @Persisted var serialNum: String = ""
    @Persisted var administrativeAddress: String = ""
    @Persisted var affairsNum: String = ""
    @Persisted(primaryKey: true) var sin: String = ""
    @Persisted var name: String = ""
    @Persisted var address: String = ""
    @Persisted var depositType: String = ""
    @Persisted var bankName: String = ""
    @Persisted var accountOwner: String = ""
    @Persisted var account: String = ""
    @Persisted var sibi: String = ""
    @Persisted var gubi: String = ""
    @Persisted var note: String = ""
}

class SpouseCashPaymentTab: Object {
    @Persisted var serialNum: String = ""
    @Persisted var administrativeAddress: String = ""
    @Persisted var affairsNum: String = ""
    @Persisted(primaryKey: true) var sin: String = ""
    @Persisted var name: String = ""
    @Persisted var address: String = ""
    @Persisted var depositType: String = ""
    @Persisted var sibi: String = ""
    @Persisted var gubi: String = ""
    @Persisted var note: String = ""
}

class SpouseNewcomerTab: Object {
    @Persisted var serialNum: String = ""
    @Persisted var applicantName: String = ""
    @Persisted var applicantSin: String = ""
    @Persisted var applicantPhoneNum: String = ""
    @Persisted var applicantPostAddress: String = ""
    @Persisted var applicantRoadAddress: String = ""
    @Persisted var administrativeAddress: String = ""
    @Persisted var veteranName: String = ""
    @Persisted var warName: String = ""
    @Persisted var veteranSin: String = ""
    @Persisted(primaryKey: true) var affairsNum: String = ""
    @Persisted var deathDate: String = ""
    @Persisted var bankName: String = ""
    @Persisted var accountOwner: String = ""
    @Persisted var account: String = ""
    @Persisted var moveInDate: String = ""
    @Persisted var applicationDate: String = ""
    @Persisted var applicationReason: String = ""
    @Persisted var note: String = ""
}

class SpouseStoppageTab: Object {
    @Persisted var serialNum: String = ""
    @Persisted var administrativeAddress: String = ""
    @Persisted var affairsNum: String = ""
    @Persisted(primaryKey: true) var sin: String = ""
    @Persisted var name: String = ""
    @Persisted var address: String = ""
    @Persisted var depositType: String = ""
    @Persisted var bankName: String = ""
    @Persisted var accountOwner: String = ""
    @Persisted var account: String = ""
    @Persisted var note: String = ""
    @Persisted var stoppageReason: String = ""
    @Persisted var stoppageDate: String = ""
    @Persisted var moveInAddress: String = ""
}

class CourtesyPaymentTargetTab: Object {
    @Persisted var serialNum: String = ""
    @Persisted var administrativeAddress: String = ""
    @Persisted var affairsNum: String = ""
    @Persisted(primaryKey: true) var sin: String = ""
    @Persisted var name: String = ""
    @Persisted var address: String = ""
    @Persisted var depositType: String = ""
    @Persisted var bankName: String = ""
    @Persisted var accountOwner: String = ""
    @Persisted var account: String = ""
    @Persisted var sibi: String = ""
    @Persisted var gubi: String = ""
    @Persisted var note: String = ""
}

class CourtesyCashPaymentTab: Object {
    @Persisted var serialNum: String = ""
    @Persisted var administrativeAddress: String = ""
    @Persisted var affairsNum: String = ""
    @Persisted(primaryKey: true) var sin: String = ""
    @Persisted var name: String = ""
    @Persisted var address: String = ""
    @Persisted var depositType: String = ""
    @Persisted var sibi: String = ""
    @Persisted var gubi: String = ""
    @Persisted var note: String = ""
}

class CourtesyNewcomerTab: Object {
    @Persisted var serialNum: String = ""
    @Persisted(primaryKey: true) var veteranType: String = ""
    @Persisted var affairsNum: String = ""
    @Persisted var postAddress: String = ""
    @Persisted var roadAddress: String = ""
    @Persisted var administrativeAddress: String = ""
    @Persisted var applicantName: String = ""
    @Persisted var birthDate: String = ""
    @Persisted var applicantSin: String = ""
    @Persisted var gender: String = ""
    @Persisted var phoneNum: String = ""
    @Persisted var bankName: String = ""
    @Persisted var accountOwner: String = ""
    @Persisted var account: String = ""
    @Persisted var moveInDate: String = ""
    @Persisted var relation: String = ""
    @Persisted var priority: String = ""
    @Persisted var applicationDate: String = ""
    @Persisted var applicationReason: String = ""
    @Persisted var note: String = ""
}

class CourtesyStoppageTab: Object {
    @Persisted var serialNum: String = ""
    @Persisted var administrativeAddress: String = ""
    @Persisted var affairsNum: String = ""
    @Persisted(primaryKey: true) var sin: String = ""
    @Persisted var name: String = ""
    @Persisted var address: String = ""
    @Persisted var depositType: String = ""
    @Persisted var bankName: String = ""
    @Persisted var accountOwner: String = ""
    @Persisted var account: String = ""
    @Persisted var note: String = ""
    @Persisted var stoppageReason: String = ""
    @Persisted var stoppageDate: String = ""
    @Persisted var moveInAddress: String = ""
}
