import Foundation
import RealmSwift
import UIKit

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

    func toPaymentTarget() -> PaymentTargetTab {
        return .init(
            serialNum: self.serialNum,
            administrativeAddress: self.administrativeAddress,
            affairsNum: self.affairsNum,
            sin: self.sin,
            name: self.name,
            address: self.address,
            depositType: self.depositType,
            bankName: self.bankName,
            accountOwner: self.accountOwner,
            account: self.account,
            sibi: self.sibi,
            gubi: self.gubi,
            note: self.note
        )
    }
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
    func toCashPayment() -> CashPaymentTab {
        return .init(
            serialNum: self.serialNum,
            administrativeAddress: self.administrativeAddress,
            affairsNum: self.affairsNum,
            sin: self.sin,
            name: self.name,
            address: self.address,
            depositType: self.depositType,
            sibi: self.sibi,
            gubi: self.gubi,
            note: self.note
        )
    }
}

class VeteranNewcomerTab: Object {
    @Persisted var serialNum: String = ""
    @Persisted var administrativeAddress: String = ""
    @Persisted(primaryKey: true) var registrationNum: String
    @Persisted var name: String = ""
    @Persisted var birthDate: String = ""
    @Persisted var sin: String = ""
    @Persisted var postAddress: String = ""
    @Persisted var roadAddress: String = ""
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
    @Persisted var name: String = ""
    @Persisted(primaryKey: true) var sin: String = ""
    @Persisted var address: String = ""
    @Persisted var depositType: String = ""
    @Persisted var bankName: String = ""
    @Persisted var accountOwner: String = ""
    @Persisted var account: String = ""
    @Persisted var stoppageReason: String = ""
    @Persisted var stoppageDate: String = ""
    @Persisted var moveInAddress: String = ""
    @Persisted var note: String = ""
    func toStoppage() -> StoppageTab {
        return .init(
            serialNum: self.serialNum,
            administrativeAddress: self.administrativeAddress,
            affairsNum: self.affairsNum,
            sin: self.sin,
            name: self.name,
            address: self.address,
            depositType: self.depositType,
            bankName: self.bankName,
            accountOwner: self.accountOwner,
            account: self.account,
            note: self.note,
            stoppageReason: self.stoppageReason,
            stoppageDate: self.stoppageDate,
            moveInAddress: self.moveInAddress
        )
    }
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
    func toPaymentTarget() -> PaymentTargetTab {
        return .init(
            serialNum: self.serialNum,
            administrativeAddress: self.administrativeAddress,
            affairsNum: self.affairsNum,
            sin: self.sin,
            name: self.name,
            address: self.address,
            depositType: self.depositType,
            bankName: self.bankName,
            accountOwner: self.accountOwner,
            account: self.account,
            sibi: self.sibi,
            gubi: self.gubi,
            note: self.note
        )
    }
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
    func toCashPayment() -> CashPaymentTab {
        return .init(
            serialNum: self.serialNum,
            administrativeAddress: self.administrativeAddress,
            affairsNum: self.affairsNum,
            sin: self.sin,
            name: self.name,
            address: self.address,
            depositType: self.depositType,
            sibi: self.sibi,
            gubi: self.gubi,
            note: self.note
        )
    }
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
    func toStoppage() -> StoppageTab {
        return .init(
            serialNum: self.serialNum,
            administrativeAddress: self.administrativeAddress,
            affairsNum: self.affairsNum,
            sin: self.sin,
            name: self.name,
            address: self.address,
            depositType: self.depositType,
            bankName: self.bankName,
            accountOwner: self.accountOwner,
            account: self.account,
            note: self.note,
            stoppageReason: self.stoppageReason,
            stoppageDate: self.stoppageDate,
            moveInAddress: self.moveInAddress
        )
    }
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
    func toPaymentTarget() -> PaymentTargetTab {
        return .init(
            serialNum: self.serialNum,
            administrativeAddress: self.administrativeAddress,
            affairsNum: self.affairsNum,
            sin: self.sin,
            name: self.name,
            address: self.address,
            depositType: self.depositType,
            bankName: self.bankName,
            accountOwner: self.accountOwner,
            account: self.account,
            sibi: self.sibi,
            gubi: self.gubi,
            note: self.note
        )
    }
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
    func toCashPayment() -> CashPaymentTab {
        return .init(
            serialNum: self.serialNum,
            administrativeAddress: self.administrativeAddress,
            affairsNum: self.affairsNum,
            sin: self.sin,
            name: self.name,
            address: self.address,
            depositType: self.depositType,
            sibi: self.sibi,
            gubi: self.gubi,
            note: self.note
        )
    }
}

class CourtesyNewcomerTab: Object {
    @Persisted var serialNum: String = ""
    @Persisted var veteranType: String = ""
    @Persisted(primaryKey: true) var affairsNum: String = ""
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
    func toStoppage() -> StoppageTab {
        return .init(
            serialNum: self.serialNum,
            administrativeAddress: self.administrativeAddress,
            affairsNum: self.affairsNum,
            sin: self.sin,
            name: self.name,
            address: self.address,
            depositType: self.depositType,
            bankName: self.bankName,
            accountOwner: self.accountOwner,
            account: self.account,
            note: self.note,
            stoppageReason: self.stoppageReason,
            stoppageDate: self.stoppageDate,
            moveInAddress: self.moveInAddress
        )
    }
}
