import Foundation

func readTextFile() -> String {
    var result = ""

    guard let paths = Bundle.main.path(forResource: "대전광역시.txt", ofType: nil) else { return "" }

    do {
        result = try String(contentsOfFile: paths, encoding: .utf8)
        return result
    } catch {
        return "Error: file read failed - \(error.localizedDescription)"
    }
}
