let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var grid = [[Int]]()

for _ in 0..<n {
    grid.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let tetrominos = [
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

func isInBounds(_ x: Int, _ y: Int) -> Bool {
    return x >= 0 && x < n && y >= 0 && y < m
}

var maxSum = 0

for i in 0..<n {
    for j in 0..<m {
        for tetromino in tetrominos {
            var sum = 0
            var valid = true
            for block in tetromino {
                let nx = i + block.0
                let ny = j + block.1
                if !isInBounds(nx, ny) {
                    valid = false
                    break
                }
                
                sum += grid[nx][ny]
            }
            if valid {
                maxSum = max(maxSum, sum)
            }
        }
    }
}
print(maxSum)
