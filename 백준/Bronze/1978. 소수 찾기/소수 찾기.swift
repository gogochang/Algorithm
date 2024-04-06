let N = Int(readLine()!)!
let numbers = readLine()!.split(separator:" ").map { Int($0)! }
var primeNums = Array(0...1001) // 배열 인덱스와 실제 수를 일치하기 위해 0부터 1001로 생성

for i in 2..<primeNums.count { // 1은 제외하고 2부터 확인
    if primeNums[i] == 0 { // 이전에 지워져서 0이라면 스킵
        continue
    }
    for j in stride(from: i+i, through: primeNums.count-1, by: i) {
        primeNums[j] = 0 // 자기자신을 제외한 배수에 해당하는 값은 0으로 삭제
    }
}
primeNums[1] = 0

var result: Int = 0
numbers.forEach {
    if primeNums.contains($0) {
        result += 1
    }
}

print(result)
