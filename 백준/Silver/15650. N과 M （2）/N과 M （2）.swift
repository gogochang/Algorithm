let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]
var result = [Int]()
var targetNum = 0

func backTrack(_ depth: Int) {
    if depth == M {
        print(result.map { String($0)}.joined(separator: " "))
        return
    }
    
    for i in 1...N {
        if targetNum < i {
            result.append(i)
            targetNum = i
            backTrack(depth + 1)
            targetNum = 0
            result.removeLast()
        }
    }
}
backTrack(0)