//let nm = readLine()!.split(separator: " ").map { Int($0)! }
//let n = nm[0]
//let m = nm[1]
//var box = [[Int]]()
//for _ in 0..<m {
//    let row = readLine()!.split(separator: " ").map { Int($0)! }
//    box.append(row)
//}
//
//var queue = [(Int, Int)]()
//
//// 초기 큐 설정 : 익은 토마토의 위치를 추가
//for i in 0..<m {
//    for j in 0..<n {
//        if box[i][j] == 1 {
//            queue.append((i,j))
//        }
//    }
//}
//
//// 방향 상, 하, 좌, 우
//let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
//
//func bfs() {
//    var index = 0
//    
//    while !queue.isEmpty {
//        let (x,y) = queue[index]
//        index += 1
//        
//        for (dx, dy) in directions {
//            let nx = x + dx
//            let ny = y + dy
//            
//            if nx >= 0 && nx < m && ny >= 0 && ny < n {
//                if box[nx][ny] == 0 {
//                    box[nx][ny] = box[x][y] + 1
//                    queue.append((nx,ny))
//                }
//            }
//            
//        }
//    }
//}
//
//bfs()
//
//var result = 0
//for row in box {
//    if row.contains(0) {
//        result = -1
//        break
//    }
//    result = max(result, row.max()! - 1)
//}
//
//print(result)

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[1]
let m = nm[0]
var box = [[Int]]()
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    box.append(row)
}

var queue = [(Int, Int)]()

// 초기 큐 설정: 익은 토마토 위치 추가
for i in 0..<n {
    for j in 0..<m {
        if box[i][j] == 1 {
            queue.append((i, j))
        }
    }
}

// 방향 상, 하, 좌, 우
let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

func bfs() {
    var index = 0

    while index < queue.count {
        let (x, y) = queue[index]
        index += 1

        for (dx, dy) in directions {
            let nx = x + dx
            let ny = y + dy

            if nx >= 0 && nx < n && ny >= 0 && ny < m && box[nx][ny] == 0 {
                // 방문하지 않은 익지 않은 토마토만 익힘
                box[nx][ny] = box[x][y] + 1
                queue.append((nx, ny))
            }
        }
    }
}

// BFS 탐색 수행
bfs()

// 결과 계산: 최대 날짜 확인
var result = 0
for row in box {
    if row.contains(0) {
        result = -1  // 익지 않은 토마토가 남아 있는 경우
        break
    }
    result = max(result, row.max()! - 1 )
}

print(result)  // 처음 익은 날(1)을 제외한 일수
