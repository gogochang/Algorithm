let input = readLine()!.split(separator: " ").map { Int($0)!}
let n = input[0] // 집의 개수
let c = input[1] // 공유기의 개수

var housePositions = [Int]() //집의 위치 정보 배열
for _ in 0..<n {
    housePositions.append(Int(readLine()!)!)
}
// 1, 2, 4, 8, 9
housePositions.sort()

func canInstallRoutes(minDistance: Int) -> Bool {
    var count = 1 // 첫 번째 집에 공유기를 설치
    var lastInstalled = housePositions[0] // 마지막으로 설치한 위치
    
    for i in 1..<housePositions.count {
        if housePositions[i] - lastInstalled >= minDistance {
            count += 1
            lastInstalled = housePositions[i]
        }
        
        if count >= c {
            return true
        }
    }
    
    return false
}

//이분 탐색
var left = 1 // 최소거래
var right = housePositions.last! - housePositions.first! // 최대 거리
var result = 0

while left <= right {
    let mid = (left + right) / 2
    
    if canInstallRoutes(minDistance: mid) {
        result = mid // 가능한 거리라면 갱신
        left = mid + 1 // 더 큰 거리 탐색
    } else {
        right = mid - 1 // 더 적은 거리 탐색
    }
}

print(result)
