let n = Int(readLine()!)! // 배열의 크기 N
let k = Int(readLine()!)! // B배열의 구할 위치 K

// 이분 탐색 함수
func countLesThanOrEuqal(to mid: Int, in size: Int) -> Int {
    var count = 0
    for i in 1...size {
        count += min(mid / i, size)
    }
    return count
}

// 이분 탐색을 사용해 K번째 수 찾기
func findKthNumber(_ n: Int, _ k: Int) -> Int {
    var low = 1
    var high = n * n
    var answer = 0
    
    while low <= high {
        let mid = (low + high) / 2
        let count = countLesThanOrEuqal(to: mid, in: n)
        
        if count >= k { //k번째 수를 넘어갈 수 있다.
            answer = mid
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return answer
}

print(findKthNumber(n, k))
