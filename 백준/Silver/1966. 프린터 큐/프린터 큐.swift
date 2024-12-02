let tc = Int(readLine()!)!
for _ in 0..<tc {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0] // 문서의 개수
    let m = nm[1] // 찾고자하는 문서가 Queue에서 몇번째 있는지를 나타내는 정수
    var priorities = readLine()!.split(separator: " ").map { Int($0)! }
    var arr: [(Int,Int)] = []
    
    for i in 0..<priorities.count {
        arr.append((i,priorities[i]))
    }

    var count = 0
    while true {
        
        let test = arr.removeFirst()
        
        var isPrint = true
        
        for element in arr {
            if test.1 < element.1 {
                arr.append(test)
                isPrint = false
                break
            }
        }
        
        if isPrint {
            count += 1
        }
        
        if isPrint && test.0 == m {
            print(count)
            break
        }
    }
}
