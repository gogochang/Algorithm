let input = Int(readLine()!)!
var count = Int(readLine()!)!
var total = 0

for i in 1...count {
    let numArr = readLine()!.split(separator: " ").map {Int($0)!}
    total = total + numArr[0] * numArr[1]
}
print( input == total ? "Yes" : "No")