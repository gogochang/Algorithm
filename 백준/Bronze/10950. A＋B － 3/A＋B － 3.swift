let line = Int(readLine()!)!
for _ in 1...line {
    let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
    print(inputArr[0] + inputArr[1])
}