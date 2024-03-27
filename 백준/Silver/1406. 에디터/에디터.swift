var left = readLine()!
var right: [Character] = []
let N = Int(readLine()!)!

(0..<N).forEach { _ in
  let action = readLine()!
  switch action {
  case "L":
    if !left.isEmpty {
      right.append(left.removeLast())
    }
  case "D":
    if !right.isEmpty {
      left.append(right.removeLast())
    }
  case "B":
    if !left.isEmpty {
      left.removeLast()
    }
  default:
    left.append(action.last!)
  }
}

print(left + right.reversed())
