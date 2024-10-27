func nextPermutation(_ arr: inout [Int]) -> Bool {
    let n = arr.count
    var i = n - 2
    
    //Step 1: 뒤에서부터 처음으로 감소하는 위치 찾기
    while i >= 0 && arr[i] >= arr[i + 1] {
        i -= 1
    }
    
    // 만약 i가 -1이면 현재가 마지막 순열임
    if i == -1 {
        return false
    }
    
    //Step 2: arr[i]보다 큰 값을 뒤에서부터 찾기
    var j = n - 1
    while arr[j] <= arr[i] {
        j -= 1
    }
    
    //Step 3: arr[i]와 arr[j]를 교환
    arr.swapAt(i, j)
    
    //Step 4: i 이후의 부분을 뒤집기
    arr[(i + 1)...].reverse()
    return true
}

// 입력 처리
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }

// 다음 순열 계산
if nextPermutation(&arr) {
    print(arr.map { String($0) }.joined(separator: " "))
} else {
    print(-1)
}
