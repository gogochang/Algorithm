let input = Int(readLine()!)!

for i in 1..<input {
    var result = ""
    for _ in 1...input  - i {
        result += " "
    }
    for _ in 1...i * 2 - 1 {
        result += "*"
    }
    print(result)
}

for i in 1...input {
    var result = ""
    for _ in 1..<i {
        result += " "
    }
    for _ in 1...input * 2 - ( i * 2 - 1) {
        result += "*"
    }
    print(result)
}