var left = Array(readLine()!)
var right: [Character] = []
let n = Int(readLine()!)!

for _ in 0..<n {
    let command = readLine()!
    switch command {
    case "L":
        if left.isEmpty { break }
        right.append(left.removeLast())
        
    case "D":
        if right.isEmpty { break }
        left.append(right.removeLast())

    case "B":
        if left.isEmpty { break }
        left.removeLast()
    default:
        left.append(Character(String(command.last!)))
    }
}

print(String(left+right.reversed()))
