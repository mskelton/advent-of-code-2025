import Foundation

func Day6(_ type: InputType) {
  let content = readFile(type: type, name: "day6")
  let lines = content.components(separatedBy: .newlines).filter { str in !str.isEmpty }

  print("Part 1: \(part1(lines))")
  print("Part 2: \(part2(lines))")
}

private func part1(_ lines: [String]) -> Int {
  return parseProblems(lines).map(solve).reduce(0, +)
}

private func part2(_ lines: [String]) -> Int {
  return parseProblemsV2(lines).map(solve).reduce(0, +)
}

typealias Problem = (op: String, values: [Int])

private func solve(_ problem: Problem) -> Int {
  return problem.values.reduce(0) { (total, value) in
    problem.op == "+" ? total + value : max(total, 1) * value
  }
}

private func parseProblemsV2(_ lines: [String]) -> [Problem] {
  var problems: [Problem] = []
  var problem: Problem = (op: "", values: [])

  let width = lines.map { line in line.count }.max()!
  let height = lines.count

  for x in 0..<width {
    var num = ""
    var op = ""

    for y in 0..<height {
      let val = lines[y].char(at: x) ?? " "
      if val == " " {
        continue
      }

      if y != height - 1 {
        num += val
      } else {
        op = val
      }
    }

    if num.isEmpty {
      continue
    }

    if !op.isEmpty && !problem.values.isEmpty {
      problems.append(problem)
      problem = (op: "", values: [])
    }

    if !op.isEmpty {
      problem.op = op
    }

    problem.values.append(Int(num)!)
  }

  problems.append(problem)
  return problems
}

private func parseProblems(_ lines: [String]) -> [Problem] {
  let raw = lines.filter { line in !line.isEmpty }.map { line in
    return line.components(separatedBy: " ").filter { chunk in !chunk.isEmpty }
  }

  var problems: [Problem] = []
  let width = raw[0].count

  for x in 0..<width {
    var row: Problem = (op: "", values: [])

    for y in 0..<raw.count {
      let val = raw[y][x]

      if y != (raw.count - 1) {
        row.values.append(Int(val)!)
      } else {
        row.op = val
      }
    }

    problems.append(row)
  }

  return problems
}
