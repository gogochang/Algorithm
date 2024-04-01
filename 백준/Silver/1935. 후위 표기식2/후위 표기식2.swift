import Foundation

let N = Int(readLine()!)!
let postfix = readLine()!
var numbers: [Double] = []
var stack: [Double] = []

(0..<N).forEach { _ in
  let value = Double(readLine()!)!
  numbers.append(value)
}

for char in postfix {
  if char == "*" {
    let first = stack.removeLast()
    let second = stack.removeLast()
    stack.append(first * second)
  } else if char == "+" {
    let first = stack.removeLast()
    let second = stack.removeLast()
    stack.append(first + second)
  } else if char == "/" {
    let first = stack.removeLast()
    let second = stack.removeLast()
    stack.append(second/first)
  } else if char == "-" {
    let first = stack.removeLast()
    let second = stack.removeLast()
    stack.append(second-first)
  } else {
    stack.append(numbers[Int(char.asciiValue!)-65])
  }
}

print(String(format: "%.2f", stack[0]))
