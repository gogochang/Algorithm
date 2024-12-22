let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

// 투포인터
var left = 0
var right = n - 1

// 값 초기화
var closestSum = Int.max
var result = (0,0)

while left < right {
    let sum = arr[left] + arr[right]
    
    if abs(sum) < abs(closestSum) {
        closestSum = sum
        result = (arr[left], arr[right])
    }
    // 합이 0보다 작으면 left를 증가
    else if sum < 0 {
        left += 1
    }
    // 합이 0보다 크면 right를 감소
    else if sum > 0 {
        right -= 1
    }
    // 합이 0 이면 종료
    else {
        break
    }
}

print(result.0, result.1)
