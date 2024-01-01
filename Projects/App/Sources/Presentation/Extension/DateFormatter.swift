import Foundation

func convertCurrentDate() -> String {
    let nowDate = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let str = dateFormatter.string(from: nowDate)
    return str
}

func getCurrentMonth() -> String {
    let nowDate = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM"
    let str = dateFormatter.string(from: nowDate)
    return "\(str)월"
}
