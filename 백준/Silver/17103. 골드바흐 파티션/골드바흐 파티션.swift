import Foundation

// 에라토스테네스의 체를 이용해 소수를 출력합니다.
func sieveOfEratosthenes(limit: Int) -> [Bool] {
    var isPrime = Array(repeating: true, count: limit+1)
    // 0과 1은 소수가 아니므로 false로 설정
    isPrime[0] = false
    isPrime[1] = false
    
    for i in 2...limit {
        if isPrime[i] {
            for multiple in stride(from: i*i, through: limit, by: i) {
                isPrime[multiple] = false
            }
        }
    }
    
    return isPrime
}

let maxLimit = 1000000
let isPrime = sieveOfEratosthenes(limit: maxLimit)

let T = Int(readLine()!)!
for _ in 0..<T {
    let n = Int(readLine()!)!
    var count = 0
    
    // 3부터 시작해서 두 소수의 합으로 n을 표현할 수 있는지 확인
    for i in 2...(n/2) {
        if isPrime[i], isPrime[n - i] {
            count += 1
        }
    }
    
    print(count)
}
