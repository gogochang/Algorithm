func nextPermutation(_ arr: inout [Int]) -> Bool {
    // Step1: 오른쪽 기준으로 오름차순이 시작하는 위치를 찾는다.
    let n = arr.count
    var i = n - 2

    while i >= 0, arr[i] < arr[i+1] {
        i -= 1
    }

    // 위치를 못찾으면 i는 -1이다.
    if i == -1 {
        return false
    }

    // Step2: 내림차순이 시작하는 위치보다 큰 수를 가장 오른쪽부터 찾는다
    var j = n - 1
    while arr[i] < arr[j] {
        j -= 1
    }

    // Step3: Step1, Step2에서 찾은 값을 서로 교환한다.
    arr.swapAt(i, j)

    // Step4: Step1에서 찾은 위치 이후의 수열을 뒤집는다.
    arr[(i+1)...].reverse()
    return true
}

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }

if nextPermutation(&arr) {
    print(arr.map { String($0) }.joined(separator: " "))
} else {
    print(-1)
}

