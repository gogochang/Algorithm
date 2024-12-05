let n = Int(readLine()!)! // 보드 사이즈 N x N
let k = Int(readLine()!)! // 사과의 개수 K
var board = Array(repeating: Array(repeating:0, count: n), count: n)
let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)] // 방향 : Up, Right, Down, Left

// 사과위치를 보드위에 기록
for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let row = input[0] - 1
    let col = input[1] - 1
    board[row][col] = 1 // board에 사과는 1로 표시
}

// 방향 전환 정보
let l = Int(readLine()!)! // 방향 변환 횟수 L
var directionChanges = [(Int, Character)]()
for _ in 0..<l {
    let input = readLine()!.split(separator: " ")
    let time = Int(input[0])!
    let direction = Character(String(input[1]))
    directionChanges.append((time, direction))
}

var time = 0
var currentDirection = 1 // 뱀의 방향 정보 (초기상태는 오른쪽)
var snake = [(0, 0)] // 뱀의 위치 및 길이 정보
board[0][0] = 2 // board에 뱀은 2로 표시

while true {
    time += 1
    
    // 다음 포지션을 계산합니다.
    let head = snake.last!
    let nextRow = head.0 + directions[currentDirection].0
    let nextCol = head.1 + directions[currentDirection].1
    
    // 다음 포지션이 유효한지 확인합니다.
    if nextRow < 0 || nextRow >= n || // 행의 위치가 보드를 부딪힌다.
        nextCol < 0 || nextCol >= n || // 열의 위치가 보드를 부딪힌다.
        board[nextRow][nextCol] == 2 { // 뱀의 몸에 부딪힌다.
        break // 게임종료
    }
    
    // 뱀 이동
    if board[nextRow][nextCol] == 1 { // 이동하려는 위치에 사과가 있는 경우
        board[nextRow][nextCol] = 2
        snake.append((nextRow, nextCol))
    } else { // 이동하는 위치에 사과가 없는 경우
        board[nextRow][nextCol] = 2
        snake.append((nextRow, nextCol))
        let tail = snake.removeFirst()
        board[tail.0][tail.1] = 0
    }
    
    // 방향에 대한 계산
    if !directionChanges.isEmpty &&
        directionChanges[0].0 == time {
        let change = directionChanges.removeFirst()
        if change.1 == "L" {
            currentDirection = (currentDirection + 3) % 4 // 왼쪽으로 회전
        } else if change.1 == "D" {
            currentDirection = (currentDirection + 1) % 4 // 오른쪽으로 회전
        }
    }
}

print(time)
