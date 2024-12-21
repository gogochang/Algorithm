let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 집의 개수
let c = input[1] // 공유기 개수
var houses: [Int] = []
for _ in 0..<n {
    houses.append(Int(readLine()!)!)
}
houses.sort()

func canInstallRoutes(minDistance: Int) -> Bool {
    var count = 1
    var lastInstalled = houses[0]
    
    for i in 1..<houses.count {
        if houses[i] - lastInstalled >= minDistance {
            count += 1
            lastInstalled = houses[i]
        }
        
        if count == c {
            return true
        }
    }
    return false
}

var left = 1
var right = houses.last! - houses.first!
var result = 0
while left <= right {
    let mid = (left + right) / 2
    if canInstallRoutes(minDistance: mid) {
        result = mid
        left = mid + 1
    } else {
        right = mid - 1
    }
    
}

print(result)