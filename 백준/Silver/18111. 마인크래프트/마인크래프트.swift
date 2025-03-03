import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M, B) = (input[0], input[1], input[2])

var land = [[Int]]()
var minH = Int.max
var maxH = 0

for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    land.append(row)
    minH = min(minH, row.min()!)
    maxH = max(maxH, row.max()!)
}

var resultTime = Int.max
var resultHeight = 0

for h in minH...maxH {
    var removeBlocks = 0
    var addBlocks = 0
    
    for i in 0..<N {
        for j in 0..<M {
            let diff = land[i][j] - h
            if diff > 0 {
                removeBlocks += diff
            } else {
                addBlocks -= diff
            }
        }
    }
    
    if removeBlocks + B >= addBlocks {  // 인벤토리 블록이 충분한 경우
        let time = (removeBlocks * 2) + addBlocks
        if time < resultTime || (time == resultTime && h > resultHeight) {
            resultTime = time
            resultHeight = h
        }
    }
}

print(resultTime, resultHeight)
