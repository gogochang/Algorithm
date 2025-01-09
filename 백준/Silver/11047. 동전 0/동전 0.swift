let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
var k = input[1]
var coins = [Int]()
for _ in 0..<n {
    coins.append(Int(readLine()!)!)
}
coins.reverse()
var count = 0
for coin in coins {
    if k == 0 {
        break
    }
    
    count += k / coin
    k = k % coin
}

print(count)