// 이진 트리 탐색 함수
func binarySearch(_ array: [Int], _ target: Int) -> Bool {
    var left = 0
    var right = array.count - 1
    
    while left <= right {
        let mid = (left + right) / 2
        if array[mid] == target {
            return true
        } else if array[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return false
}

let n = Int(readLine()!)!
let nArr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let m = Int(readLine()!)!
let mArr = readLine()!.split(separator: " ").map { Int($0)! }

var result = ""
for mNum in mArr {
    result += binarySearch(nArr,mNum) ? "1\n" : "0\n"
}

print(result)
