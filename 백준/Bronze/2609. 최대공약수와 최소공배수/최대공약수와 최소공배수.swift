let input = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
var A = input[0]
var B = input[1]

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

print(gcd)
print(lcm)
