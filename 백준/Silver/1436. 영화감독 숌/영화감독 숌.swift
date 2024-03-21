/// 6이 맞으면 count는 1씩 증가하고,
/// 6이 아니면 count는 0으로 초기화됩니다.
/// count가 3이되면 true를 반환합니다.
func containsTripleSix(at num: Int) -> Bool {
    var count = 0
    for i in String(num) {
        count = (i == "6") ? count+1 : 0
        if count >= 3 {
            return true
        }
    }
    return false
}


let input = Int(readLine()!)!
var num = 666 // 666부터 시작
var count = 0

while true {
    count = containsTripleSix(at: num) ? count+1 : count
    if count == input {
        print(num)
        break
    }
    num += 1
}

