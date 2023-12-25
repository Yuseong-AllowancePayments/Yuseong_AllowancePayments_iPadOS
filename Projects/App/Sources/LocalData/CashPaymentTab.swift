import Foundation

class CashPaymentTab {
    var serialNum: String
    var administrativeAddress: String
    var affairsNum: String
    var sin: String
    var name: String
    var address: String
    var depositType: String
    var sibi: String
    var gubi: String
    var note: String

    init(serialNum: String, administrativeAddress: String, affairsNum: String, sin: String, name: String, address: String, depositType: String, sibi: String, gubi: String, note: String) {
        self.serialNum = serialNum
        self.administrativeAddress = administrativeAddress
        self.affairsNum = affairsNum
        self.sin = sin
        self.name = name
        self.address = address
        self.depositType = depositType
        self.sibi = sibi
        self.gubi = gubi
        self.note = note
    }
}
