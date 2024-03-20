func isChessboardValid(targetBoard: [[String]], firstColor: String) -> Int {
    var board = targetBoard
    var preSquareColor = firstColor
    var count = 0
    for i in 0..<board.count {
        for j in 0..<board[i].count {
            if board[i][j] == preSquareColor {
                count += 1
                
                board[i][j] = board[i][j] == "W" ? "B" : "W"
            }
            preSquareColor = board[i][j]
        }
        preSquareColor = preSquareColor == "W" ? "B" : "W"
    }
    return count
}


let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]
var board: [[String]] = []
for _ in 0..<N {
    board.append(readLine()!.map { String($0) })
}
var result: Int = 32

for i in 0..<board.count-7 {
    for j in 0..<board[i].count-7 {
        let targetBoard = (i...i+7).map { Array(board[$0][j...j+7]) }
        
        result = min(
            result,
            isChessboardValid(
                targetBoard: targetBoard,
                firstColor: "B"
            ),
            isChessboardValid(
                targetBoard: targetBoard,
                firstColor: "W"
            )
        )
    }
}

print(result)