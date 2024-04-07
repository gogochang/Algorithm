let input = readLine()!.split(separator: " ").map { Int($0)! }
let M = input[0]
let N = input[1]


var nums: [Int] = Array(repeating: 0, count: N + 1)
for i in 2...N {
    nums[i] = i
}

//var nums = Array(0...N)
for i in 2..<N {
    if nums[i] == 0 {
        continue
    }
    
    for j in stride(from: i+i, through: N, by: i) {
        nums[j] = 0
    }
}

for i in M...N {
    if nums[i] != 0 {
        print("\(nums[i])")
    }
}
