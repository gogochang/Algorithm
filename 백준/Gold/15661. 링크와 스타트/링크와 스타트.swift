let N = Int(readLine()!)!
var ability = [[Int]]()
for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    ability.append(row)
}

var result = Int.max

func minDifference(_ alst: [Int], _ blst: [Int]) -> Int {
    var asum = 0
    var bsum = 0
    for i in 0..<alst.count {
        for j in 0..<alst.count {
            asum += ability[alst[i]][alst[j]]
        }
    }
    
    for i in 0..<blst.count {
        for j in 0..<blst.count {
            bsum += ability[blst[i]][blst[j]]
        }
    }
    return abs(asum - bsum)
}

func dfs(_ depth: Int, _ alst: [Int], _ blst: [Int]) {
    if depth == N {
        // 종료 조건
        if alst.count > 0 && blst.count > 0 {
            result = min(result, minDifference(alst, blst))
        }
        return
    }
    
    // depth를 alst에 추가한 경우
    dfs(depth + 1, alst + [depth], blst)
    
    // depth를 blst에 추가한 경우
    dfs(depth + 1, alst, blst + [depth])
}

dfs(0, [], [])
print(result)
