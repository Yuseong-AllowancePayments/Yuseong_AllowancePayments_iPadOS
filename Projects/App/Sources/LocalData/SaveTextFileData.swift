import Foundation

var administrativeDistrict: [String: String] = [
    "진잠동": "01-진잠동",
    "학하동": "02-학하동",
    "원신흥동": "03-원신흥동",
    "상대동": "04-상대동",
    "온천1동": "05-온천1동",
    "온천2동": "06-온천2동",
    "노은1동": "07-노은1동",
    "노은2동": "08-노은2동",
    "노은3동": "09-노은3동",
    "신성동": "10-신성동",
    "전민동": "11-전민동",
    "구즉동": "12-구즉동",
    "관평동": "13-관평동"
]

func readTextFile() -> Any {
    guard let paths = Bundle.main.path(forResource: "대전광역시.txt", ofType: nil) else { return "" }
    let dbHelper = DBHelper()
    do {
        let data = try String(contentsOfFile: paths, encoding: .utf8).components(separatedBy: .newlines)
        data.forEach { line in
            let str = line.replacingOccurrences(of: "|||", with: "| | |")
                .replacingOccurrences(of: "||", with: "| |")
                .split(separator: "|")
            print(str, str[19])
            dbHelper.insertIntoAdministration(String(str[0]), administrativeDistrict["\(str[19])"] ?? "")
        }
        return "Successfully Inserted"
    } catch {
        return "Error: file read failed - \(error.localizedDescription)"
    }
}
