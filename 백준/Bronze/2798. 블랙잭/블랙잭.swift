let input = readLine()!.split(separator: " ").map {Int($0)!}
let n = input[0]
let m = input[1]

let cards = readLine()!.split(separator: " ").map {Int($0)!}

var result = 0
for i in 0..<cards.count {
    for j in i+1..<cards.count {
        for k in j+1..<cards.count {
            let sum = cards[i] + cards[j] + cards[k]
            if sum <= m && result <= sum {
                result = sum
            }
        }
    }
}

print(result)