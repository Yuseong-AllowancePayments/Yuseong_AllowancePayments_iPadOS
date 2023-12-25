import Foundation

class StoppageTab {
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
    var note: String
    var stoppageReason: String
    var stoppageDate: String
    var moveInAddress: String

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
        note: String,
        stoppageReason: String,
        stoppageDate: String,
        moveInAddress: String
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
        self.note = note
        self.stoppageReason = stoppageReason
        self.stoppageDate = stoppageDate
        self.moveInAddress = moveInAddress
    }
}
