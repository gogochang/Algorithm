let count = Int(readLine()!)!
for i in 1...count {
    let inputArr = readLine()!.split(separator: " ").map {Int($0)!}
    print("Case #\(i): \(inputArr[0] + inputArr[1])")
}