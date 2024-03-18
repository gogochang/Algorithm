let input = readLine()!.split(separator: " ").map { Int($0)! }

let max = input.max() ?? 0
var sum = input.reduce(0, {$0 + $1}) - max

if max >= sum {
    print(sum + (sum - 1))
} else {
    print(sum+max)
}
