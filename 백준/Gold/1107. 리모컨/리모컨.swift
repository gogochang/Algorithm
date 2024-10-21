func isValid(_ num: Int, broken: Set<Int>) -> Bool {
    var n = num
    if n == 0 {
        return !broken.contains(0)
    }
    
    while n > 0 {
        if broken.contains(n % 10) {
            return false
        }
        n /= 10
    }
    
    return true
}

let n = Int(readLine()!)! // 목표 채널
let m = Int(readLine()!)! // 고장난 버튼 개수
var broken = Set<Int>() // 고장난 버튼들, 중복되지 않기 때문에 Set타입을 사용

if m > 0 { // 고장난 버튼 개수가 0보다 크면 broken에 고장난 버튼 목록 저장
    broken = Set(readLine()!.split(separator: " ").map { Int($0)! })
}

// 현재 채널 100번에서 +, - 만 눌러서 이동하는 경우
let startChannel = 100
var minPress = abs(n - startChannel)

// 0번부터 999,999까지의 채널을 탐색 (최대 6자리 숫자이므로 999,999까지 탐색 가능)
for channel in 0...999999 {
    if isValid(channel, broken: broken) {
        let pressCount = String(channel).count + abs(channel - n)
        minPress = min(minPress, pressCount)
    }
}

print(minPress)
