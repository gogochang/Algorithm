let T = Int(readLine()!)!
var result: [Int] = []
for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
    if input.count < 2 {
        continue
    }
    func findGCD(_ a: Int, _ b: Int) -> Int {
        var x = a
        var y = b
        while y != 0 {
            let r = x % y
            x = y
            y = r
        }
        
        return x
    }
    let gcd = findGCD(input[0], input[1])
    let lcm = input[0] * input[1] / gcd
    
    result.append(lcm)
}

result.forEach {
    print($0)
}
