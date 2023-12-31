import Foundation

struct VeteranParseModel: Codable {
    let paymentTargetTab: [PaymentTarget]
    let cashPaymentTab: [CashPayment]
    let newComerTab: [VeteranNewComer]
    let stoppageTab: [Stoppage]
}

struct SpouseParseMdoel: Codable {
    let paymentTargetTab: [PaymentTarget]
    let cashPaymentTab: [CashPayment]
    let newComerTab: [SpouseNewcomer]
    let stoppageTab: [Stoppage]
}

struct CourtesyParseMdoel: Codable {
    let paymentTargetTab: [PaymentTarget]
    let cashPaymentTab: [CashPayment]
    let newComerTab: [CourtesyNewcomer]
    let stoppageTab: [Stoppage]
}

struct PaymentTarget: Codable {
    let serialNum: String
    let administrativeAddress: String
    let affairsNum: String
    let sin: String
    let name: String
    let address: String
    let depositType: String
    let bankName: String
    let accountOwner: String
    let account: String
    let sibi: String
    let gubi: String
    let note: String
}

struct CashPayment: Codable {
    let serialNum: String
    let administrativeAddress: String
    let affairsNum: String
    let sin: String
    let name: String
    let address: String
    let depositType: String
    let sibi: String
    let gubi: String
    let note: String
}

struct Stoppage: Codable {
    let serialNum: String
    let administrativeAddress: String
    let affairsNum: String
    let name: String
    let sin: String
    let address: String
    let depositType: String
    let bankName: String
    let accountOwner: String
    let account: String
    let stoppageReason: String
    let stoppageDate: String
    let note: String
    let moveInAddress: String
}

struct VeteranNewcomer: Codable {
    let serialNum: String
    let administrativeAddress: String
    let registrationNum: String
    let name: String
    let sin: String
    let address: String
    let depositType: String
    let bankName: String
    let accountOwner: String
    let account: String
    let moveInDate: String
    let applicationDate: String
    let applicationReason: String
    let note: String
}

struct SpouseNewcomer: Codable {
    let serialNum: String
    let administrativeAddress: String
    let applicantName: String
    let applicantSin: String
    let applicantPhoneNum: String
    let veteranName: String
    let veteranSin: String
    let affairsNum: String
    let warName: String
    let deathDate: String
    let address: String
    let depositType: String
    let bankName: String
    let accountOwner: String
    let account: String
    let moveInDate: String
    let applicationDate: String
    let applicationReason: String
    let note: String
}

struct CourtesyNewcomer: Codable {
    let serialNum: String
    let administrativeAddress: String
    let affairsNum: String
    let applicantName: String
    let applicantSin: String
    let veteranType: String
    let applicantGeneder: String
    let applicantPhoneNum: String
    let address: String
    let depositType: String
    let bankName: String
    let accountOwner: String
    let account: String
    let relation: String
    let priority: String
    let moveInDate: String
    let applicationDate: String
    let applicationReason: String
    let note: String
}
