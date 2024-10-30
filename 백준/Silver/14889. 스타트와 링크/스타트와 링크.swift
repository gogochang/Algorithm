let N = Int(readLine()!)!
var arr = [[Int]]()
for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(row)
}

let M = N / 2
var ans = Int.max

func calDifference(_ alst: [Int], _ blst: [Int]) -> Int {
    var asm = 0
    var bsm = 0
    
    // 각 팀의 능력치 계산
    for i in 0..<M {
        for j in 0..<M {
            asm += arr[alst[i]][alst[j]]
            bsm += arr[blst[i]][blst[j]]
        }
    }
    
    return abs(asm - bsm)
}

func dfs(_ depth: Int, _ alst: [Int], _ blst: [Int]) {
    // 팀 인원이 같은 경우만 계산
    if depth == N && alst.count == blst.count{
        // 최소 능력치 차이 갱신
        ans = min(ans, calDifference(alst, blst))
        return
    }
    
    // A팀에 현재 인덱스 추가
    if alst.count < M {
        dfs(depth + 1, alst + [depth], blst)
    }
    
    // B팀에 현재 인덱스 추가
    if blst.count < M {
        dfs(depth + 1, alst, blst + [depth])
    }
}

dfs(0, [], [])
print(ans)
