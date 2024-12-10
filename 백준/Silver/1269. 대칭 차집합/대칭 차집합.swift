let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var dict: [Int: Int] = [:]

for num in readLine()!.split(separator: " ").map({ Int($0)! }) {
    dict[num, default: 0] += 1
}

for num in readLine()!.split(separator: " ").map({ Int($0)! }) {
    dict[num, default: 0] += 1
}

print(dict.filter { $0.value == 1}.count)

