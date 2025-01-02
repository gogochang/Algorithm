let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 강의 개수
let m = input[1] // 블루레이 개수
let lessons = readLine()!.split(separator: " ").map { Int($0)! }

var left = lessons.max()! // 현재 주어진 문제에서 만들 수 있는 가장 작은 값
var right = lessons.reduce(0, +) // 현재 주어진 문제에서 만들 수 있는 가장 큰 값
var result = 0

func canDivide(_ size: Int) -> Bool {
    var count = 1
    var sum = 0
    
    for lesson in lessons {
        if sum +  lesson > size {
            count += 1
            sum = lesson
        } else {
            sum += lesson
        }
    }
    return count <= m
}

while left <= right {
    let mid = (left + right) / 2
    
    if canDivide(mid) {
        result = mid
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(result)
