import Foundation

func readFile(_ filePath: String) -> String {
    do {
        let url = URL(fileURLWithPath: filePath)
        return try String(contentsOf: url, encoding: .utf8)
    } catch {
        print(error)
        return ""
    }
}

enum InputType {
    case simple
    case full
}
