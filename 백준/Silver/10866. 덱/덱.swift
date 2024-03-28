let N = Int(readLine()!)!
var deque: [Int] = []
var outputs: [Int] = []
(0..<N).forEach { _ in
  let action = readLine()!
  
  switch action {
  case "pop_front":
    outputs.append(deque.isEmpty ? -1 : deque.removeFirst())
  case "pop_back":
    outputs.append(deque.isEmpty ? -1 : deque.removeLast())
  case "size":
    outputs.append(deque.count)
  case "empty":
    outputs.append(deque.isEmpty ? 1 : 0)
  case "front":
    outputs.append(deque.isEmpty ? -1 : deque[0])
  case "back":
    outputs.append(deque.isEmpty ? -1 : deque.last!)
  default:
    let action = action.split(separator:" ").map { $0 }
    var number: [Int] = [Int(action[1])!]
    
    if action[0] == "push_front" {
      deque = number + deque
    } else if action[0] == "push_back" {
      deque = deque + number
    }
    return
  }
}

outputs.forEach {
  print($0)
}
