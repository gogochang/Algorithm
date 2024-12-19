let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 칭호의 개수
let m = input[1] // 캐릭터들의 개수

// 칭호와 전투력
var titles: [(String, Int)] = []
for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    let name = String(input[0])
    let power = Int(input[1])!
    titles.append((name, power))
}

// 플레이어 전투력
var players: [Int] = []
for _ in 0..<m {
    players.append(Int(readLine()!)!)
}

// 이분 탐색 함수
func findTitle(for power: Int) -> String {
    var left = 0
    var right = titles.count - 1
    var result = ""
    
    while left <= right {
        let mid = (left + right) / 2
        
        if power <= titles[mid].1 {
            result = titles[mid].0
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return result
}

var result = ""
for player in players {
    result += "\(findTitle(for: player))\n"
}

print(result)
