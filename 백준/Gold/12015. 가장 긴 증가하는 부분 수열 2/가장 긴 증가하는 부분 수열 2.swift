let n = Int(readLine()!)!
let sequence = readLine()!.split(separator: " ").map { Int($0)! }

//// LIS 계산을 위한 배열
var lis = [Int]()

for num in sequence {
    if lis.isEmpty || lis.last! < num {
        // LIS의 끝에 현재 숫자를 추가
        lis.append(num)
    } else {
        // 이분 탐색으로 num이 들어갈 위치를 찾기
        var left = 0
        var right = lis.count - 1
        while left < right {
            let mid = (left + right) / 2
            if lis[mid] < num {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        lis[left] = num
    }
}

print(lis.count)
