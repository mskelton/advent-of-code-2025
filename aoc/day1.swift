// Copyright © 2025 Mark Skelton.
// All Rights Reserved.

import Foundation

func Day1(_ type: InputType) {
    let content = readFile(type == .simple ? "~/dev/aoc/day1-simple.txt" : "~/dev/aoc/day1.txt")
    let lines = content.components(separatedBy: .newlines)

    part1(lines)
    part2(lines)
}

private func part1(_ lines: [String]) {
    var dial = 50
    var totalZeros = 0

    for line in lines {
        if line.isEmpty {
            continue
        }

        let direction = line.first ?? "R"
        let count = Int(line.dropFirst(1))!

        if direction == "R" {
            dial += count
        } else {
            dial -= count
        }

        dial = dial % 100

        if dial == 0 {
            totalZeros += 1
        }
    }

    print(totalZeros)
}

private func part2(_ lines: [String]) {
    var dial = 50
    var totalZeros = 0

    for line in lines {
        if line.isEmpty {
            continue
        }

        let direction = line.first ?? "R"
        let count = Int(line.dropFirst(1))!
        let original = dial

        if direction == "R" {
            dial += count
        } else {
            dial -= count
        }

        if dial >= 100 {
            totalZeros += dial / 100
            dial = dial % 100
        } else if dial <= 0 {
            let crossed = original > 0 ? 1 : 0
            totalZeros += abs(dial) / 100 + crossed
            dial = 100 + (dial % 100)
        }

        if dial == 100 {
            dial = 0
        }
    }

    print(totalZeros)
}
