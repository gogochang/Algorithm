let tc = Int(readLine()!)! // 테스트 케이스 개수
var result = ""
for _ in 0..<tc {
    let n = Int(readLine()!)! // '수첩1'에 적어 놓은 정수 개수
    var nArr = readLine()!.split(separator: " ").map { Int($0)! }.sorted() // 수첩1
    let m = Int(readLine()!)! // '수첩2'에 적어 놓은 정수 개수
    var mArr = readLine()!.split(separator: " ").map { Int($0)! } // 수첩2
    
    func binarySearch(targetNum: Int) -> Bool {
        var startIndex = 0
        var endIndex = nArr.count - 1
        
        while startIndex <= endIndex {
            var mid = (startIndex + endIndex) / 2
            
            if nArr[mid] == targetNum {
                return true
            } else if nArr[mid] > targetNum {
                endIndex = mid - 1
            } else {
                startIndex = mid + 1
            }
        }
        
        return false
    }
    
    for target in mArr {
        result += binarySearch(targetNum: target) ? "1\n" : "0\n"
    }
    
    
}
print(result)