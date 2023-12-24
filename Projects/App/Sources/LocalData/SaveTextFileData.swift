import Foundation

func readTextFile() -> Any {
    guard let paths = Bundle.main.path(forResource: "대전광역시.txt", ofType: nil) else { return "" }
    do {
        let data = try String(contentsOfFile: paths, encoding: .utf8).components(separatedBy: .newlines)
        var arr = [Any]()
        data.forEach { line in
            arr.append(
                line.replacingOccurrences(of: "|||", with: "| | |")
                .replacingOccurrences(of: "||", with: "| |")
                .split(separator: "|")
            )
        }
//        data.components(separatedBy: .newlines).map {
//            $0.replacingOccurrences(of: "|||", with: "| | |")
//                .replacingOccurrences(of: "||", with: " | |")
//                .split(separator: "|")
//        }
        return arr
    } catch {
        return "Error: file read failed - \(error.localizedDescription)"
    }
}
