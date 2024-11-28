let tc = Int(readLine()!)!
var arr = [[Int]]()

for _ in 0..<tc {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(row)
}

for i in 0..<tc {
    let h = arr[i][0]
    let w = arr[i][1]
    let n = arr[i][2]
    var count = 0
    
    for j in 1...w {
        var floor = 0
        for k in 1...h {
            floor = 100 * k
            count += 1
            if count == n {
                print(floor + j)
            }
        }
    }
}
