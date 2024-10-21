// 최대공약수 (GCD) 함수 - 유클리드 호제법 사용
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

// 최소 공배수 (LCM) 함수
func lcm(_ a: Int, _ b: Int) -> Int {
    return (a * b) / gcd(a, b)
}

func findK(_ M: Int, _ N: Int, _ x: Int, _ y: Int) -> Int {
    let maxYear = lcm(M,N)
    
    var k = x
    while k <= maxYear {
        if (k - 1) % N + 1 == y {
            return k
        }
        k += M
    }
    
    return -1
}

let t = Int(readLine()!)!

for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let M = input[0]
    let N = input[1]
    let x = input[2]
    let y = input[3]
    
    print(findK(M, N, x, y))
}
