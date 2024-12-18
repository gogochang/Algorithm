let tc = Int(readLine()!)!
for _ in 0..<tc {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let _ = input[0] // A의 수
    let _ = input[1] // B의 수
    let aArr = readLine()!.split(separator: " ").map { Int($0)! }
    let bArr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    
    var count = 0
    func countLessThan(target: Int) -> Int {
        var left = 0
        var right = bArr.count - 1
        var result = 0
        while left <= right {
            let mid = (left + right) / 2
            
            if bArr[mid] < target {
                result = mid + 1
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return result
    }
    
    for num in aArr {
        count += countLessThan(target: num)
    }
    
    print(count)
}