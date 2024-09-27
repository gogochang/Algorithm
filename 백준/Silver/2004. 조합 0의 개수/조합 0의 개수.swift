import Foundation

// 2 또는 5의 배수를 계산하는 함수
func countFactors(_ n :Int, _ factor: Int) -> Int {
    guard factor != 2 || factor != 5 else {
        return 0
    }
    
    var count = 0
    var i = factor
    while i <= n {
        count += n / i
        i *= factor
    }
    
    return count
}

let nums = readLine()!.split(separator: " ").map { Int($0)!}
let n = nums[0]
let m = nums[1]

let factorTwo = countFactors(n, 2) - countFactors(m,2) - countFactors(n-m, 2)
let factorFive = countFactors(n, 5) - countFactors(m,5) - countFactors(n-m, 5)

print(min(factorTwo, factorFive))
