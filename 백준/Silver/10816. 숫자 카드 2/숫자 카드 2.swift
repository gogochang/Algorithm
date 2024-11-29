let n = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let m = Int(readLine()!)!
let numberToFind = readLine()!.split(separator: " ").map { Int($0)! }

// 카드 개수를 저정할 딕셔너리
var cardCounts: [Int: Int] = [:]

// 카드 수 계산
for card in cards {
    cardCounts[card, default: 0] += 1
}

// 결과 저장
var results: [String] = []
for number in numberToFind {
    results.append(String(cardCounts[number, default: 0]))
}

print(results.joined(separator: " "))
