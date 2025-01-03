let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var jews = [Int]()

for _ in 0..<m {
    let input = Int(readLine()!)!
    jews.append(input)
}

var (left, right) = (1, jews.max()!)

while left <= right {
    let mid = (left + right) / 2
    var total = 0

    for jew in jews {
        if jew % mid == 0 {
            total += jew / mid
        } else {
            total += (jew / mid) + 1
        }
    }

    if total > n {  // 받을 수 있는 학생 수를 초과했으므로 인당 받는 보석개수(mid)를 늘려줌
        left = mid + 1
    } else {    //  못받은 학생에게 나눠주어 인당 받는 보석개수(mid)를 줄여줌
        right = mid - 1
    }
}
print(left)