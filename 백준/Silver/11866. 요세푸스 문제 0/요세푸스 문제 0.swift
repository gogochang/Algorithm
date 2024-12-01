let input = readLine()!.split(separator: " ").map{ Int($0)! }
let n = input[0]
let k = input[1]
var arr: [Int] = [Int](1...n)
var index = 0
var result: [String] = []

while !arr.isEmpty {
    index = (index + k - 1) % arr.count
    result.append(String(arr.remove(at: index)))
}

print("<"+result.joined(separator: ", ")+">")
