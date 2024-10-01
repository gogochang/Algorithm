let input = readLine()!.split(separator: " ").map { Int($0)! }
let baseA = input[0] // A 진법
let baseB = input[1] // B 진법
var count = Int(readLine()!)! // A진법 수의 자릿수
var result: [Int] = []

let nums = readLine()!.split(separator: " ").map { Int($0)! }

var aaa = 1
var resultTen = 0
for num in nums.reversed() {
    resultTen += num * aaa
    aaa *= baseA
}

while resultTen != 0 {
    let remainder = resultTen % baseB
    resultTen /= baseB
    result.append(remainder)
}

result.reversed().forEach {
    print($0,terminator: " ")
}
