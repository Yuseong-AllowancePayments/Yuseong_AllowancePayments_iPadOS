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

func readFileByLine(from fileUrl: URL) async throws -> Array<Any> {
    var arr = [Any]()
    for try await line in fileUrl.lines {
        arr.append(line.replacingOccurrences(of: "|||", with: "| | |").replacingOccurrences(of: "||", with: "| |").split(separator: "|"))
    }
    return arr
}
