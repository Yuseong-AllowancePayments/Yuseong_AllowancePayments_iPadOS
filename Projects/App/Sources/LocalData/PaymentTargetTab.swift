import Foundation

class PaymentTargetTab {
    var serialNum: String
    var administrativeAddress: String
    var affairsNum: String
    var sin: String
    var name: String
    var address: String
    var depositType: String
    var bankName: String
    var accountOwner: String
    var account: String
    var sibi: String
    var gubi: String
    var note: String

    init(
        serialNum: String,
        administrativeAddress: String,
        affairsNum: String,
        sin: String,
        name: String,
        address: String,
        depositType: String,
        bankName: String,
        accountOwner: String,
        account: String,
        sibi: String,
        gubi: String,
        note: String
    ) {
        self.serialNum = serialNum
        self.administrativeAddress = administrativeAddress
        self.affairsNum = affairsNum
        self.sin = sin
        self.name = name
        self.address = address
        self.depositType = depositType
        self.bankName = bankName
        self.accountOwner = accountOwner
        self.account = account
        self.sibi = sibi
        self.gubi = gubi
        self.note = note
    }
}
