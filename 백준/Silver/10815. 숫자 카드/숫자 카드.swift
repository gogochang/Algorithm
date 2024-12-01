let n = Int(readLine()!)!
let nArr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let m = Int(readLine()!)!
let mArr = readLine()!.split(separator: " ").map { Int($0)! }


func binarySearch(_ arr: [Int], _ targetNum: Int) -> Bool {
    var left = 0
    var right = arr.count - 1
    
    while left <= right {
        let mid = (left + right) / 2
        if arr[mid] == targetNum {
            return true
        } else if arr[mid] < targetNum {
            left = mid + 1
        } else if arr[mid] > targetNum {
            right = mid - 1
        }
    }
    return false
}


var result = ""
for i in mArr {
    result += binarySearch(nArr, i) ? "1 " : "0 "
}

print(result)

