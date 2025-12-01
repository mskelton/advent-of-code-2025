import Foundation

func readFile(forResource: String, withExtension: String) -> String {
    do {
        let url = Bundle.main.url(forResource: forResource, withExtension: withExtension)
        let contents = try String(contentsOf: url!, encoding: .utf8)
        return contents
    } catch {
        print(error)
        return ""
    }
}

