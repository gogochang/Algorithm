import Foundation

let n = Int(readLine()!)!
let expression = readLine()!
var values = [Double]()
var stack = [Double]()

for _ in 0..<n {
    values.append(Double(readLine()!)!)
}

for char in expression {
    if char.isLetter {
        let index = Int(char.asciiValue! - Character("A").asciiValue!)
        stack.append(values[index])
    } else {
        let second = stack.removeLast()
        let first = stack.removeLast()
        
        switch char {
        case "+":
            stack.append(first + second)
        case "-":
            stack.append(first - second)
        case "*":
            stack.append(first * second)
        case "/":
            stack.append(first / second)
        default:
            break
        }
    }
}

print(String(format: "%.2f", stack.first!))
