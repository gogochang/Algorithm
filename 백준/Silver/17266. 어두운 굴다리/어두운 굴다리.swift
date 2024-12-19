// 입력
let n = Int(readLine()!)! // 굴다리의 길이
let _ = readLine()! // 가로등의 개수
let lampPositions = readLine()!.split(separator: " ").map { Int($0)! }

// 램프의 높이 유효성 검사
func isValidHeight(_ height: Int) -> Bool {
    var lastCovered = 0
    // 1. 현재 포지션에 이전 위치가 넘는지
    // 2. 현재 포지션에 다음 위치가 넘는지 // 1,2 둘다 참이여야만 -> true
    // 3. 포지션과 포지션 사이에 안 비춰지는 공간이 있는지? -> false
    for position in lampPositions {
        if position - height > lastCovered {
            // 현재 포지션 기준 왼쪽 범위가 다 비춰지지 않음 (안 비추는공간이 생김)
            return false
        }
        // 이전 범위가 문제없으면 lastCovered를 갱신
        lastCovered = position + height
    }
    
    // 각 포지션의 위치 기준 왼쪽 범위가 문제없이 모두 비춰지면
    // 굴다리 길이의 마지막 부분이 빠진 부분 없이 모두 비춰졌는지 확인 후 반환
    return lastCovered >= n
}

// 이분탐색
var left = 0
var right = n
var result = n

while left <= right {
    let mid = (left + right) / 2
    
    if isValidHeight(mid) {
        result = mid
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(result)
