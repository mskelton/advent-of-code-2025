import Foundation

func readFile(type: InputType, name: String) -> String {
    let pwd = "~/dev/aoc/data"
    let filePath = type == .simple ? "\(pwd)/\(name)-simple.txt" : "\(pwd)/\(name).txt"

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

extension String {
    func char(at offset: Int) -> String? {
        guard offset >= 0 && offset < self.count else {
            return nil
        }

        return String(self[self.index(self.startIndex, offsetBy: offset)])
    }
}
