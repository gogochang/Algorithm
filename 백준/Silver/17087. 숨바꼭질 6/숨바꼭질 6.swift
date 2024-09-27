func gcd(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    while b != 0 {
        let remainder = a % b
        a = b
        b = remainder
    }
    return a
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0] // 동생의 수
let S = input[1] // 수빈이의 위치

let locations = readLine()!.split(separator: " ").map {Int($0)!}
var distances = locations.map { abs($0-S) } // 동생위치 - 수빈위치 를 절대값으로 저장

var result = distances[0]
for i in 1..<distances.count {
    result = gcd(result, distances[i])
}

print(result)

