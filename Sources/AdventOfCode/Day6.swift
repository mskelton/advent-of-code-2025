import Foundation

func Day6(_ type: InputType) {
  let content = readFile(type: type, name: "day6")
  let lines = content.components(separatedBy: .newlines).filter { str in !str.isEmpty }

  print("Part 1: \(part1(lines))")
  print("Part 2: \(part2(lines))")
}

private func part1(_ lines: [String]) -> Int {
  let problems = parseProblems(lines)
  var total = 0

  for problem in problems {
    total += solve(problem)
  }

  return total
}

typealias Problem = (op: String, values: [Int])

private func solve(_ problem: Problem) -> Int {
  var total = 0

  for value in problem.values {
    switch problem.op {
    case "+":
      total += value
    case "*":
      total = max(total, 1) * value
    default:
      total += 0
    }
  }

  return total
}

private func part2(_ lines: [String]) -> Int {
  let problems = parseProblemsV2(lines)
  var total = 0

  for problem in problems {
    total += solve(problem)
  }

  return total
}

extension String {
  func char(at offset: Int) -> Character? {
    guard offset >= 0 && offset < self.count else {
      return nil
    }

    return self[self.index(self.startIndex, offsetBy: offset)]
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
      let val = String(lines[y].char(at: x) ?? Character(" "))

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
  var raw: [[String]] = []

  for line in lines {
    if line.isEmpty {
      continue
    }

    let chunks = line.components(separatedBy: " ")
    var arr: [String] = []

    for chunk in chunks {
      if chunk.isEmpty {
        continue
      }

      arr.append(chunk)
    }

    raw.append(arr)
  }

  var problems: [Problem] = []
  let width = raw[0].count

  for x in 0..<width {
    var row: Problem = (op: "", values: [])

    for y in 0..<raw.count {
      if y != (raw.count - 1) {
        row.values.append(Int(raw[y][x])!)
      } else {
        row.op = raw[y][x]
      }
    }

    problems.append(row)
  }

  return problems
}
