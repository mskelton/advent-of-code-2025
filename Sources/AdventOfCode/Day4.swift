import Foundation

func Day4(_ type: InputType) {
    let content = readFile(type: type, name: "day4")
    let lines = content.components(separatedBy: .newlines)

    print("Part 1: \(part1(lines))")
    print("Part 2: \(part2(lines))")
}

extension Array {
    public subscript(safeIndex index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}

private func part1(_ lines: [String]) -> Int {
    let grid = parseGrid(lines)
    let width = grid[0].count
    let height = grid.count

    var total = 0

    for i in 0..<height {
        for j in 0..<width {
            let valid = grid[i][j] == "@" && isValid(grid: grid, x: i, y: j)

            if valid {
                total += 1
            }
        }
    }

    return total
}

private func isValid(grid: [[String]], x: Int, y: Int) -> Bool {
    // Don't count ourself
    var total = -1

    for i in -1...1 {
        for j in -1...1 {
            if grid[safeIndex: x + i]?[safeIndex: y + j] == "@" {
                total += 1
            }
        }
    }

    return total < 4
}

private func part2(_ lines: [String]) -> Int {
    var grid = parseGrid(lines)
    let width = grid[0].count
    let height = grid.count

    var total = 0
    var batch = 0

    repeat {
        total += batch
        batch = 0

        for i in 0..<height {
            for j in 0..<width {
                let valid = grid[i][j] == "@" && isValid(grid: grid, x: i, y: j)

                if valid {
                    batch += 1
                    grid[i][j] = "x"
                }
            }
        }
    } while batch > 0

    return total
}

private func parseGrid(_ lines: [String]) -> [[String]] {
    var result: [[String]] = []

    for line in lines {
        if line.isEmpty {
            continue
        }

        var arr: [String] = []

        for char in line {
            arr.append(String(char))
        }

        result.append(arr)
    }

    return result
}
