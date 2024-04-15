private func GCD(_ m: Int, _ n: Int) -> Int {
    if n==0 {
        return m
    } else {
        return GCD(n, m%n)
    }
}

let NS = readLine()!.split(separator: " ").map { Int($0)! }
let N = NS[0]
let S = NS[1]

let Ai = readLine()!.split(separator: " ").map { Int($0)! }

var distance: [Int] = []
for i in 0..<Ai.count {
    distance.append(abs((S-Ai[i])))
}

var result = distance[0]
for i in 0..<distance.count {
    if result < distance[i] {
        result = GCD(distance[i], result)
    } else {
        result = GCD(result,distance[i])
    }
}
print(result)