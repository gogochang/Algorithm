let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)] // 상하좌우
var lab = [[Int]]()
var emptySpaces = [(Int, Int)]()
var viruses = [(Int, Int)]()
var maxSafeArea = 0

// 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

for i in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    lab.append(row)
    for j in 0..<m {
        if row[j] == 0 { // 빈 칸이면
            emptySpaces.append((i,j)) // 빈칸의 좌표를 저장
        } else if row[j] == 2 { // 바이러스면
            viruses.append((i,j)) // 바이러스의 좌표를 저장
        }
    }
}

//BFS를 사용해 바이러스 퍼뜨리기
func spreadVirus(_ lab: inout [[Int]]) {
    var queue = viruses
    while !queue.isEmpty {
        let (x, y) = queue.removeFirst()
        for (dx, dy) in directions {
            let nx = x + dx
            let ny = y + dy
            if nx >= 0, ny >= 0, nx < n, ny < m, lab[nx][ny] == 0 {
                lab[nx][ny] = 2
                queue.append((nx, ny))
            }
        }
    }
}

// 안전 영역 계산
func calculateSafeArea(_ lab: [[Int]]) -> Int {
    return lab.flatMap { $0 }.filter { $0 == 0 }.count
}

// 벽 세우기 (백트래킹)
func buildWall(_ count: Int, _ start: Int, _ lab: inout [[Int]]) {
    if count == 3 {
        var copiedLab = lab
        spreadVirus(&copiedLab)
        maxSafeArea = max(maxSafeArea, calculateSafeArea(copiedLab))
        return
    }
    
    for i in start..<emptySpaces.count {
        let (x, y) = emptySpaces[i]
        lab[x][y] = 1
        buildWall(count + 1, i + 1, &lab)
        lab[x][y] = 0
    }
}

buildWall(0, 0, &lab)
print(maxSafeArea)

