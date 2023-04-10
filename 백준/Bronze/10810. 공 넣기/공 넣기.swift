let input = readLine()!.split(separator: " " ).map{ Int($0)! }
var basket: [Int] = []

for _ in 1...input[0] {
    basket.append(0)
}
for _ in 1...input[1] {
    let inputBall = readLine()!.split(separator: " ").map{ Int($0)! }
    for i in inputBall[0] - 1...inputBall[1] - 1 {
        basket[i] = inputBall[2]
    }
    
}
print(basket.map{ String($0)}.joined(separator: " "))
