import Foundation

let n = Int(readLine()!)!
var ingredients: [(sour: Int, bitter: Int)] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    ingredients.append((sour: input[0], bitter: input[1]))
}

var minDifference = Int.max

func dfs(index: Int, sour: Int, bitter: Int, count: Int) {
    if count > 0 { // 최소 한 개 이상의 재료를 선택해야 함
        minDifference = min(minDifference, abs(sour - bitter))
    }

    for i in index..<n {
        dfs(index: i + 1, 
            sour: sour * ingredients[i].sour, 
            bitter: bitter + ingredients[i].bitter, 
            count: count + 1)
    }
}

dfs(index: 0, sour: 1, bitter: 0, count: 0)

print(minDifference)
