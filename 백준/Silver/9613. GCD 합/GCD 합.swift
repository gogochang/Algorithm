private func GCD(_ m: Int, _ n: Int) -> Int {
    if n==0 {
        return m
    } else {
        return GCD(n, m%n)
    }
}

let N = Int(readLine()!)!
var results: [Int] = []

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var sum = 0
    for i in 1..<input.count {
        for j in i+1..<input.count {
            sum += GCD(input[i], input[j])
        }
    }
    results.append(sum)
}

results.forEach {
    print($0)
}
