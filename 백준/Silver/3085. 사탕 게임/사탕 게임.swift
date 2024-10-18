import Foundation

let n = Int(readLine()!)! // 보드 크기
var board = [[Character]]()

// 입력 받기
for _ in 0..<n {
    let row = Array(readLine()!)
    board.append(row)
}

// 가로 방향으로 교체
func swapRow(_ board: [[Character]], _ row: Int, _ column: Int) -> [[Character]] {
    var boardAfterSwap = board
    let temp = boardAfterSwap[row][column]
    boardAfterSwap[row][column] = boardAfterSwap[row][column+1]
    boardAfterSwap[row][column+1] = temp
    return boardAfterSwap
}

// 세로 방향으로 교체
func swapColumn(_ board: [[Character]], _ row: Int, _ column: Int) -> [[Character]] {
    var boardAfterSwap = board
    let temp = boardAfterSwap[row][column]
    boardAfterSwap[row][column] = boardAfterSwap[row+1][column]
    boardAfterSwap[row+1][column] = temp
    return boardAfterSwap
}

// 가장 긴 같은 사탕이 연속된 사탕의 길이를 반환합니다.
func checkMaxCandies(_ board: [[Character]]) -> Int {
    var maxCandies = 1

    // 가로 방향 체크
    for row in 0..<n {
        var count = 1
        for column in 0..<n-1 {
            if board[row][column] == board[row][column+1] {
                count += 1
            } else {
                count = 1
            }
            maxCandies = max(maxCandies, count)
        }
    }

    // 세로 방향 체크
    for column in 0..<n {
        var count = 1
        for row in 0..<n-1 {
            if board[row][column] == board[row+1][column] {
                count += 1
            } else {
                count = 1
            }
            maxCandies = max(maxCandies, count)
        }
    }

    return maxCandies
}

var result = 0

// 가로로 스왑하며 최대 길이 확인
for i in 0..<n {
    for j in 0..<n-1 {
        let swappedBoard = swapRow(board, i, j)
        result = max(result, checkMaxCandies(swappedBoard))
    }
}

// 세로로 스왑하며 최대 길이 확인
for i in 0..<n-1 {
    for j in 0..<n {
        let swappedBoard = swapColumn(board, i, j)
        result = max(result, checkMaxCandies(swappedBoard))
    }
}

print(result)