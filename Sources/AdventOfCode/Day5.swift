import Foundation

func Day5(_ type: InputType) {
    let content = readFile(type: type, name: "day5")
    let lines = content.components(separatedBy: .newlines)

    print("Part 1: \(part1(lines))")
    print("Part 2: \(part2(lines))")
}

private func part1(_ lines: [String]) -> Int {
    let (fresh, ingrediants) = parseInput(lines)
    var total = 0

    for ingrediant in ingrediants {
        if isFresh(fresh: fresh, ingrediant: ingrediant) {
            total += 1
        }
    }

    return total
}

private func isFresh(fresh: [(start: Int, end: Int)], ingrediant: Int) -> Bool {
    for range in fresh {
        if ingrediant >= range.start && ingrediant <= range.end {
            return true
        }
    }

    return false
}

private func parseInput(_ lines: [String]) -> ([(start: Int, end: Int)], [Int]) {
    var stage = 0
    var fresh: [(start: Int, end: Int)] = []
    var ingrediants: [Int] = []

    for line in lines {
        if line.isEmpty {
            stage += 1
            continue
        }

        if stage == 0 {
            fresh.append(parseFreshRange(line))
        } else if stage == 1 {
            ingrediants.append(Int(line)!)
        }
    }

    return (fresh, ingrediants)
}

private func parseFreshRange(_ line: String) -> (start: Int, end: Int) {
    let parts = line.components(separatedBy: "-")
    let start = Int(parts[0])!
    let end = Int(parts[1])!

    return (start, end)
}

private func part2(_ lines: [String]) -> Int {
    let fresh = parseInput(lines).0.sorted(by: { a, b in b.0 > a.0 })

    var total = 0
    var end = -1

    for range in fresh {
        let start = max(range.0, end + 1)
        let diff = (range.1 + 1) - start

        if diff > 0 {
            total += diff
            end = range.1
        }
    }

    return total
}
