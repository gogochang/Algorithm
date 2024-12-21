let n = Int(readLine()!)!
let arr = readLine()!.split(separator:" ").map { Int($0)! }.sorted()

// 투 포인터 초기화
var left = 0
var right = n - 1

// 초기값
var closestSum = Int.max
var result = (0, 0)

while left < right {
    let sum = arr[left] + arr[right]
    
    // 0에 더 가까운 값인지 확인
    if abs(sum) < abs(closestSum) {
        closestSum = sum
        result = (arr[left], arr[right])
    }
    
    // 합이 0보다 작으면 left 증가
    if sum < 0 {
        left += 1
    }
    // 합이 0보다 크면 right 감소
    else if sum > 0 {
        right -= 1
    }
    // 합이 정확히 0이면 정답
    else {
        break
    }
}

print(result.0, result.1)
