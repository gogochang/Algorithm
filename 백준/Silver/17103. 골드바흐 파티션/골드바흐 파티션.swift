import Foundation

func primeNums(num: Int) -> [Int] {
    var arr = Array(0...num)
    var count = Int(sqrt(Double(num))) + 1
    arr[1] = 0
    for i in 2..<count {
        if arr[i] != 0 {
            var idx = 2
            while idx * i <= num {
                arr[idx * i] = 0
                idx += 1
            }
        }
    }
    return arr
}

let n = Int(readLine()!)!
var results: [Int] = []
for _ in 0..<n {
    let num = Int(readLine()!)!
    var set = primeNums(num: num)
    var result = 0
    
    for j in 2...num/2 {
        let sub = num - j
        if set[j] != 0 {
            if set[sub] != 0 {
                result += 1
            }
        }
    }
//    print(result)
    results.append(result)
}

results.forEach { num in
    print(num)
}
