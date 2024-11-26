let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

// 맵
var map = [[Int]]()
for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

let tetrominoes = [
    [(0,0), (0,1), (0,2), (0,3)], // ----
    [(0,0), (1,0), (2,0), (3,0)], // |
    
    [(0,0), (0,1), (1,0), (1,1)], // ㅁ
    
    [(0,0), (1,0), (2,0), (2,1)], // ㄴ
    [(0,0), (0,1), (0,2), (1,0)], //
    [(0,0), (0,1), (1,1), (2,1)], //
    [(0,2), (1,0), (1,1), (1,2)], //
    
    [(0,1), (1,1), (2,0), (2,1)], // Reverse L
    [(0,0), (1,0), (1,1), (1,2)],
    [(0,0), (0,1), (1,0), (2,0)],
    [(0,0), (0,1), (0,2), (1,2)],
    
    [(0,0), (1,0), (1,1), (2,1)], // Z
    [(0,1), (0,2), (1,0), (1,1)],
    
    [(0,1), (1,0), (1,1), (2,0)], // Reverse Z
    [(0,0), (0,1), (1,1), (1,2)],
    
    [(0,0), (0,1), (0,2), (1,1)], // ㅜ
    [(0,1), (1,0), (1,1), (2,1)], // ㅓ
    [(0,1), (1,0), (1,1), (1,2)], // ㅗ
    [(0,0), (1,0), (1,1), (2,0)], // ㅏ
]


var maxScore = 0

func isValid(_ x: Int, _ y: Int) -> Bool {
    return x >= 0 && x < n && y >= 0 && y < m
}

func calculateTetrominoScore(_ x: Int, _ y: Int, _ shape: [(Int,Int)] ) {
    var score = 0
    
    for (dx, dy) in shape {
        let nx = x + dx
        let ny = y + dy
        if !isValid(nx, ny) {
            return
        }
        
        score += map[nx][ny]
    }
    maxScore = max(maxScore, score)
}

for i in 0..<n {
    for j in 0..<m {
        for shape in tetrominoes {
            calculateTetrominoScore(i,j, shape)
        }
    }
}

print(maxScore)
