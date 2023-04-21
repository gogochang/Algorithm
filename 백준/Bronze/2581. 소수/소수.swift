let N = Int(readLine()!)!
let M = Int(readLine()!)!
var result: [Int] = []

for i in N...M {
    var count = 0
    for j in 1...i {
        if i % j == 0 {
            count += 1
        }
    }
    if count == 2 {
        result.append(i)
    }
}
if result.isEmpty {
    print(-1)
} else {
    print(result.reduce(0,+))
    print(result.min()!)
}