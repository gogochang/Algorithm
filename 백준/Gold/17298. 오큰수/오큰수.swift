let n = Int(readLine()!)!  // 배열의 크기 N
let arr = readLine()!.split(separator: " ").map { Int($0)! }  // 수열 입력
var result = Array(repeating: -1, count: n)  // 결과를 저장할 배열 (-1로 초기화)
var stack = [Int]()  // 스택에는 배열의 인덱스를 저장

for i in 0..<n {
    // 스택이 비어있지 않고, 현재 원소가 스택의 top에 해당하는 원소보다 크다면
    while !stack.isEmpty && arr[stack.last!] < arr[i] {
        // 스택에서 pop한 인덱스의 오큰수는 현재 원소
        result[stack.popLast()!] = arr[i]
    }
    
    // 현재 인덱스를 스택에 넣는다.
    stack.append(i)
}

// 결과 출력
print(result.map { String($0) }.joined(separator: " "))
