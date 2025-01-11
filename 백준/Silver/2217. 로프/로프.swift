let n = Int(readLine()!)! // 로프 수
var ropes = [Int]()
for _ in 0..<n {
    ropes.append(Int(readLine()!)!)
}
ropes.sort(by: >) // 내림차순으로 정렬 (큰 수부터 확인하기위해)

var maxWeight = 0
for i in 0..<n {
    let weight = ropes[i] * (i + 1)
    maxWeight = max(maxWeight, weight)
}

print(maxWeight)
