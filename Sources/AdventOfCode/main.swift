import Foundation

func main() {
    let args = CommandLine.arguments
    let type: InputType = args.contains("full") ? .full : .simple

    let days: [(InputType) -> Void] = [
        Day1,
        Day2,
        Day3,
        Day4,
        Day5,
        Day6,
        // Day7,
        // Day8,
        // Day9,
        // Day10,
        // Day11,
        // Day12,
    ]

    days.last?(type)
}

main()
