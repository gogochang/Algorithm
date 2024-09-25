// 최대공약수 (유클리드 호제법)
func gcd(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    // b가 0이 될 때 까지 반복
    while b != 0 {
        let remainder = a%b
        a = b
        b = remainder
    }
    
    return a
}

// 최소공배수
func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

let num = Int(readLine()!)!
for _ in 0..<num {
    let inputs = readLine()!.split(separator: " ").map { Int($0)! }
    print(lcm(inputs[0], inputs[1]))
}

