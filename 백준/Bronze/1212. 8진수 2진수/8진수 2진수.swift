var binary: [String] = [ "000", "001", "010", "011", "100", "101", "110", "111" ]
let nums = readLine()!.map { Int(String($0))! }
var answer: String = ""

// 첫 번째 숫자는 앞의 '0'을 제거하여 처리
answer += String(Int(binary[nums[0]])!)

// 나머지 숫자들은 그대로 3자리 이진수로 처리
for num in nums.dropFirst() {
    answer += binary[num]
}

// 빈 문자열이 되면 "0"을 출력
if answer.isEmpty {
    answer = "0"
}

print(answer)

