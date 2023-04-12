let input = readLine()!.split(separator: " ").map{ Int($0)! }
var basket = Array(1...input[0])
var tempBasket = Array(1...input[0])

for _ in 1...input[1] {
    let rotation = readLine()!.split(separator: " ").map{ Int($0)! }
    let begin = rotation[0] - 1
    let end = rotation[1] - 1
    let mid = rotation[2] - 1
    if begin == mid { continue }
    let change = basket[mid...end] + basket[begin...mid - 1]
    basket.replaceSubrange(begin...end, with: change)
}
print(basket.map{ String($0)}.joined(separator: " "))
