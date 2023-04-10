let input = readLine()!.split(separator: " " ).map{ Int($0)! }
var basket: [Int] = []
for i in 1...input[0] {
    basket.append(i)
}

for _ in 1...input[1] {
    let inputBall = readLine()!.split(separator: " ").map{ Int($0)! }
    
    let tempBall = basket[inputBall[0] - 1]
    basket[inputBall[0] - 1] = basket[inputBall[1] - 1]
    basket[inputBall[1] - 1] = tempBall
}
print(basket.map{ String($0)}.joined(separator: " "))