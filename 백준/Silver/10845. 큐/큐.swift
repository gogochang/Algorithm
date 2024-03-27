var N = Int(readLine()!)!
var results: [Int] = []
var queue: [Int] = []
(0..<N).forEach { _ in
  let action = readLine()!
  switch action {
  case "pop":
    if queue.isEmpty {
      results.append(-1)
    } else {
      results.append(queue.removeFirst())
    }
  case "size":
    results.append(queue.count)
  case "empty":
    results.append(queue.isEmpty ? 1 : 0)
  case "front":
    if queue.isEmpty {
      results.append(-1)
    } else {
      results.append(queue.first ?? -1)
    }
  case "back":
    if queue.isEmpty {
      results.append(-1)
    } else {
      results.append(queue.last ?? -1)
    }
  default:
    let num = action.split(separator: " ").map { Int($0) }[1]!
    queue.append(num)
  }
}

results.forEach {
  print($0)
}
