// 입력 받기
let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

// 각 숫자의 빈도를 계산하기 위한 딕셔너리
var frequency = [Int: Int]()
for num in arr {
    frequency[num, default: 0] += 1
}

// 결과를 저장할 배열 (-1로 초기화)
var result = Array(repeating: -1, count: n)
var stack = [Int]()  // 스택에는 배열의 인덱스를 저장

// 배열을 순회하며 오등큰수 찾기
for i in 0..<n {
    // 스택이 비어있지 않고, 현재 원소의 빈도가 스택 top의 원소의 빈도보다 크다면
    while !stack.isEmpty && frequency[arr[stack.last!]]! < frequency[arr[i]]! {
        result[stack.popLast()!] = arr[i]
    }
    
    // 현재 인덱스를 스택에 넣음
    stack.append(i)
}

// 결과 출력
print(result.map { String($0) }.joined(separator: " "))
