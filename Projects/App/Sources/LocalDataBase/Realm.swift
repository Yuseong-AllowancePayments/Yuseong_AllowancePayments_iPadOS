import Foundation
import RealmSwift

final class LocalData: Object {
    @Persisted var veteranTable: VeteranTable
    @Persisted var spouseTable : SpouseTable
    @Persisted var courtesyTable: CourtesyTable
}

class VeteranTable: Object {
    @Persisted var paymentTargetTab: List<PaymentTargetTab>
    @Persisted var cashPaymentTab: List<CashPaymentTab>
    @Persisted var newComerVeteranTab: List<NewcomerVeteranTab>
    @Persisted var stoppageTab: List<StoppageTab>
}

class SpouseTable: Object {
    @Persisted var paymentTargetTab: List<PaymentTargetTab>
    @Persisted var cashpaymentTab: List<CashPaymentTab>
    @Persisted var newComerSpouseTab: List<NewcomerSpouseTab>
    @Persisted var stoppageTab: List<StoppageTab>
}

class CourtesyTable: Object {
    @Persisted var paymentTargetTab: List<PaymentTargetTab>
    @Persisted var cashpaymentTab: List<CashPaymentTab>
    @Persisted var newComerCourtesyTab: List<NewcomerCourtesyTab>
    @Persisted var stoppageTab: List<StoppageTab>
}

class PaymentTargetTab: Object {
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

class CashPaymentTab: Object {
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

class StoppageTab: Object {
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

class NewcomerVeteranTab: Object {
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

class NewcomerSpouseTab: Object {
    @Persisted var serial_num: String
    @Persisted var applicant_name: String
    @Persisted var applicant_sin: String
    @Persisted var applicant_phone_num: String
    @Persisted var applicant_post_address: String
    @Persisted var applicant_road_address: String
    @Persisted var administrative_address: String
    @Persisted var veteran_name: String
    @Persisted var war_name: String
    @Persisted var veteran_sin: String
    @Persisted(primaryKey: true) var affairs_num: String
    @Persisted var death_date: String
    @Persisted var bank_name: String
    @Persisted var account_owner: String
    @Persisted var account: String
    @Persisted var move_in_date: String
    @Persisted var application_date: String
    @Persisted var application_reason: String
    @Persisted var note: String
}

class NewcomerCourtesyTab: Object {
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
