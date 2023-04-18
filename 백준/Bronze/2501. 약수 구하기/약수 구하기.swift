let input = readLine()!.split(separator: " ").map{Int($0)!}
let N = input[0], K = input[1]
var i = 0
var result = 0

var nFactorCount = 0
for i in 1...N {
    if N % i == 0 {
        nFactorCount += 1
    }
}

while true {
    if nFactorCount < K {
        print(0)
        break
    }
    i += 1
    if N % i == 0 {
        result += 1
    }
    if result == K {
        print(i)
        break
    }
}
