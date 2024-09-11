var input = readLine()!.split(separator: " ").map { Int($0)!}
var index = 0
var arr = Array(1...input[0])
var answer: [Int] = []

while !arr.isEmpty {
    index = (index+input[1]-1)%arr.count
    answer.append(arr.remove(at: index))
}

print("<\(answer.map {"\($0)"}.joined(separator: ", "))>")