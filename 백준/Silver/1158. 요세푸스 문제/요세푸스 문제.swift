let input = readLine()!.split(separator:" ").map { Int($0)! }
let N = input[0]
let K = input[1]
var arr: [Int] = Array(1...N)
var results: [Int] = []
var index: Int = 0

(0..<N).forEach { _ in
  index = (index+(K-1)) % arr.count
  results.append(arr.remove(at: index))
}

print("<\(results.map{String($0)}.joined(separator: ", "))>")
