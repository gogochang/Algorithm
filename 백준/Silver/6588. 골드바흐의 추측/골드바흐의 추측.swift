let N = 1000000
var nums = Array(0...N)
nums[1] = 0

for i in 2..<N {
    if nums[i] == 0 {
        continue
    }
    
    for j in stride(from: i+i, through: N, by: i) {
        nums[j] = 0
    }
}

let primeNums = nums.map { $0 != 0 }

while true {
    let n = Int(readLine()!)!
    if n == 0 { break }
    var isGoldbach = false
    
    for i in 3...n {
        if primeNums[i] {
            let diff = n - i
            if primeNums[diff] {
                isGoldbach = true
                print("\(n) = \(i) + \(diff)")
                break
            }
        }
    }
    
    if !isGoldbach {
        print("Goldbach's conjecture is wrong.")
    }
}
