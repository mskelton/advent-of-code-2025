import Foundation

func readFile(type: InputType, name: String) -> String {
    let pwd = FileManager.default.currentDirectoryPath
    let filePath =
        type == .simple ? "\(pwd)/data/\(name)-simple.txt" : "\(pwd)/data/\(name).txt"

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
