import Foundation
import RealmSwift

final class LocalData: Object {
    @Persisted var veteranTable: VeteranTable
    @Persisted var spouseTable : SpouseTable
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
    @Persisted var serial_num: String = ""
    @Persisted var administrative_address: String = ""
    @Persisted var affairs_num: String = ""
    @Persisted(primaryKey: true) var sin: String = ""
    @Persisted var name: String = ""
    @Persisted var address: String = ""
    @Persisted var deposit_type: String = ""
    @Persisted var bank_name: String = ""
    @Persisted var account_owner: String = ""
    @Persisted var account: String = ""
    @Persisted var sibi: String = ""
    @Persisted var gubi: String = ""
    @Persisted var note: String = ""
}

class VeteranCashPaymentTab: Object {
    @Persisted var serial_num: String = ""
    @Persisted var administrative_address: String = ""
    @Persisted var affairs_num: String = ""
    @Persisted(primaryKey: true) var sin: String = ""
    @Persisted var name: String = ""
    @Persisted var address: String = ""
    @Persisted var deposit_type: String = ""
    @Persisted var sibi: String = ""
    @Persisted var gubi: String = ""
    @Persisted var note: String = ""
}

class VeteranNewcomerTab: Object {
    @Persisted var serial_num: String = ""
    @Persisted var name: String = ""
    @Persisted var birth_date: String = ""
    @Persisted var sin: String = ""
    @Persisted(primaryKey: true) var registration_num: String = ""
    @Persisted var post_address: String = ""
    @Persisted var road_address: String = ""
    @Persisted var administrative_address: String = ""
    @Persisted var phone_num: String = ""
    @Persisted var account_owner: String = ""
    @Persisted var bank_name: String = ""
    @Persisted var account: String = ""
    @Persisted var move_in_date: String = ""
    @Persisted var application_date: String = ""
    @Persisted var application_reason: String = ""
    @Persisted var note: String = ""
}

class VeteranStoppageTab: Object {
    @Persisted var serial_num: String = ""
    @Persisted var administrative_address: String = ""
    @Persisted var affairs_num: String = ""
    @Persisted(primaryKey: true) var sin: String = ""
    @Persisted var name: String = ""
    @Persisted var address: String = ""
    @Persisted var deposit_type: String = ""
    @Persisted var bank_name: String = ""
    @Persisted var account_owner: String = ""
    @Persisted var account: String = ""
    @Persisted var note: String = ""
    @Persisted var stoppage_reason: String = ""
    @Persisted var stoppage_date: String = ""
    @Persisted var move_in_address: String = ""
}

class SpousePaymentTargetTab: Object {
    @Persisted var serial_num: String = ""
    @Persisted var administrative_address: String = ""
    @Persisted var affairs_num: String = ""
    @Persisted(primaryKey: true) var sin: String = ""
    @Persisted var name: String = ""
    @Persisted var address: String = ""
    @Persisted var deposit_type: String = ""
    @Persisted var bank_name: String = ""
    @Persisted var account_owner: String = ""
    @Persisted var account: String = ""
    @Persisted var sibi: String = ""
    @Persisted var gubi: String = ""
    @Persisted var note: String = ""
}

class SpouseCashPaymentTab: Object {
    @Persisted var serial_num: String = ""
    @Persisted var administrative_address: String = ""
    @Persisted var affairs_num: String = ""
    @Persisted(primaryKey: true) var sin: String = ""
    @Persisted var name: String = ""
    @Persisted var address: String = ""
    @Persisted var deposit_type: String = ""
    @Persisted var sibi: String = ""
    @Persisted var gubi: String = ""
    @Persisted var note: String = ""
}

class SpouseNewcomerTab: Object {
    @Persisted var serial_num: String = ""
    @Persisted var applicant_name: String = ""
    @Persisted var applicant_sin: String = ""
    @Persisted var applicant_phone_num: String = ""
    @Persisted var applicant_post_address: String = ""
    @Persisted var applicant_road_address: String = ""
    @Persisted var administrative_address: String = ""
    @Persisted var veteran_name: String = ""
    @Persisted var war_name: String = ""
    @Persisted var veteran_sin: String = ""
    @Persisted(primaryKey: true) var affairs_num: String = ""
    @Persisted var death_date: String = ""
    @Persisted var bank_name: String = ""
    @Persisted var account_owner: String = ""
    @Persisted var account: String = ""
    @Persisted var move_in_date: String = ""
    @Persisted var application_date: String = ""
    @Persisted var application_reason: String = ""
    @Persisted var note: String = ""
}

class SpouseStoppageTab: Object {
    @Persisted var serial_num: String = ""
    @Persisted var administrative_address: String = ""
    @Persisted var affairs_num: String = ""
    @Persisted(primaryKey: true) var sin: String = ""
    @Persisted var name: String = ""
    @Persisted var address: String = ""
    @Persisted var deposit_type: String = ""
    @Persisted var bank_name: String = ""
    @Persisted var account_owner: String = ""
    @Persisted var account: String = ""
    @Persisted var note: String = ""
    @Persisted var stoppage_reason: String = ""
    @Persisted var stoppage_date: String = ""
    @Persisted var move_in_address: String = ""
}

class CourtesyPaymentTargetTab: Object {
    @Persisted var serial_num: String = ""
    @Persisted var administrative_address: String = ""
    @Persisted var affairs_num: String = ""
    @Persisted(primaryKey: true) var sin: String = ""
    @Persisted var name: String = ""
    @Persisted var address: String = ""
    @Persisted var deposit_type: String = ""
    @Persisted var bank_name: String = ""
    @Persisted var account_owner: String = ""
    @Persisted var account: String = ""
    @Persisted var sibi: String = ""
    @Persisted var gubi: String = ""
    @Persisted var note: String = ""
}

class CourtesyCashPaymentTab: Object {
    @Persisted var serial_num: String = ""
    @Persisted var administrative_address: String = ""
    @Persisted var affairs_num: String = ""
    @Persisted(primaryKey: true) var sin: String = ""
    @Persisted var name: String = ""
    @Persisted var address: String = ""
    @Persisted var deposit_type: String = ""
    @Persisted var sibi: String = ""
    @Persisted var gubi: String = ""
    @Persisted var note: String = ""
}

class CourtesyNewcomerTab: Object {
    @Persisted var serial_num: String = ""
    @Persisted(primaryKey: true) var veteran_type: String = ""
    @Persisted var affairs_num: String = ""
    @Persisted var post_address: String = ""
    @Persisted var road_address: String = ""
    @Persisted var administrative_address: String = ""
    @Persisted var applicant_name: String = ""
    @Persisted var birth_date: String = ""
    @Persisted var applicant_sin: String = ""
    @Persisted var gender: String = ""
    @Persisted var phone_num: String = ""
    @Persisted var bank_name: String = ""
    @Persisted var account_owner: String = ""
    @Persisted var account: String = ""
    @Persisted var move_in_date: String = ""
    @Persisted var relation: String = ""
    @Persisted var priority: String = ""
    @Persisted var application_date: String = ""
    @Persisted var application_reason: String = ""
    @Persisted var note: String = ""
}

class CourtesyStoppageTab: Object {
    @Persisted var serial_num: String = ""
    @Persisted var administrative_address: String = ""
    @Persisted var affairs_num: String = ""
    @Persisted(primaryKey: true) var sin: String = ""
    @Persisted var name: String = ""
    @Persisted var address: String = ""
    @Persisted var deposit_type: String = ""
    @Persisted var bank_name: String = ""
    @Persisted var account_owner: String = ""
    @Persisted var account: String = ""
    @Persisted var note: String = ""
    @Persisted var stoppage_reason: String = ""
    @Persisted var stoppage_date: String = ""
    @Persisted var move_in_address: String = ""
}
