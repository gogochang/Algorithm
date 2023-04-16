let T = Int(readLine()!)!
let coins = [25, 10,5, 1]
var result: [[Int]] = []

for _ in 0..<T {
    var input = Int(readLine()!)!
    var changes: [Int] = []
    
    for coin in coins {
        changes.append(input/coin)
        input = input%coin
    }
    result.append(changes)
}

for i in result {
    print(i.map{String($0)}.joined(separator: " "))
}