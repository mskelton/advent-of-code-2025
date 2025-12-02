// Copyright © 2025 Mark Skelton.
// All Rights Reserved.

import Foundation

func Day2(_ type: InputType) {
    let content = readFile(type == .simple ? "~/dev/aoc/day2-simple.txt" : "~/dev/aoc/day2.txt").trimmingCharacters(in: .whitespacesAndNewlines)

    let ids = parseIds(content)

    print("Part 1: \(part1(ids))")
    print("Part 2: \(part2(ids))")
}

private func part1(_ ids: [Int]) -> Int {
    var total = 0

    for id in ids {
        let split = splitId(id)

        if (split.first == split.last) {
            total += id
        }
    }

    return total
}

private func part2(_ ids: [Int]) -> Int {
    var total = 0

    for id in ids {
        if (isRepeating(id)) {
            total += id
        }
    }

    return total
}

private func isRepeating(_ id: Int) -> Bool {
    let str = String(id)
    
    if (str.count <= 1) {
        return false
    }
    
    for i in 1...(str.count / 2) {
        let parts = String(id).splitIntoChunks(ofLength: i)
        
        if (parts.count > 1 && Set(parts).count == 1) {
            return true
        }
    }
    
    return false
}



extension String {
    func splitIntoChunks(ofLength length: Int) -> [String] {
        var result: [String] = []
        var currentIndex = self.startIndex
        
        while currentIndex < self.endIndex {
            let endIndex = self.index(currentIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            let chunk = String(self[currentIndex..<endIndex])
            result.append(chunk)
            currentIndex = endIndex
        }
        
        return result
    }
}

private func splitId(_ id: Int) -> (first: String, last: String) {
    let str = String(id)
    let half = str.count / 2

    let first = str.prefix(half)
    let last = str.dropFirst(half)

    return (first: String(first), last: String(last))
}

private func parseIds(_ content: String) -> [Int] {
    let ranges = content.components(separatedBy: ",")
    var ids: [Int] = []

    for range in ranges {
        let parts = range.components(separatedBy: "-")
        let start = Int(parts.first!)!
        let end = Int(parts.last!)!

        for id in start...end {
            ids.append(id)
        }
    }

    return ids
}
