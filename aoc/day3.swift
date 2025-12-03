// Copyright © 2025 Mark Skelton.
// All Rights Reserved.

import Foundation

func Day3(_ type: InputType) {
    let content = readFile(type == .simple ? "~/dev/aoc/day3-simple.txt" : "~/dev/aoc/day3.txt")
    let lines = content.components(separatedBy: .newlines)

    print("Part 1: \(part1(lines))")
    part2(lines)
}

private func part1(_ lines: [String]) -> Int {
    var total = 0

    for line in lines {
        let joltage = parseJoltage(line)
        total += joltage
    }

    return total
}

private func parseJoltage(_ bank: String) -> Int {
    var joltage: (Int, Int) = (0, 0)

    for char in bank {
        let digit = Int(String(char)) ?? 0

        // Shift the right to the left if it creates a higher number
        if joltage.1 > joltage.0 {
            joltage.0 = joltage.1
            joltage.1 = 0
        }

        // Push new digits in from the right
        if digit > joltage.1 {
            joltage.1 = digit
        }
    }

    return joltage.0 * 10 + joltage.1
}

private func part2(_ lines: [String]) {

}
