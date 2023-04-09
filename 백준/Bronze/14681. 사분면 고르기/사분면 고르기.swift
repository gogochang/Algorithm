let firstNum = Int(readLine()!)!
let secondNum = Int(readLine()!)!

if firstNum > 0 && secondNum > 0 {
    print("1")
} else if firstNum < 0 && secondNum > 0 {
    print("2")
} else if firstNum < 0 && secondNum < 0 {
    print("3")
} else if firstNum > 0 && secondNum < 0 {
    print("4")
}