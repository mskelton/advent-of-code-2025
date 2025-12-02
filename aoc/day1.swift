import Foundation

func Day1() {
    part1()
}

func part1() {
    let content = readFile("~/dev/aoc/day1.txt")
    let lines = content.components(separatedBy: .newlines)

    var dial = 50
    var totalZeros = 0
    
    for line in lines {
        if line.isEmpty {
            continue
        }
        
        let direction = line.first ?? "R"
        let count = Int(line.dropFirst(1))!
        
        if (direction == "R") {
            dial += count
        } else {
            dial -= count
        }
        
        dial = dial % 100
        
        if (dial == 0) {
            totalZeros += 1
        }
    }
    
    print(totalZeros)
}
