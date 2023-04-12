let input = readLine()!.split(separator: " ").map {Int($0)!}
var piece = [1,1,2,2,2,8]
for i in 0..<piece.count {
    piece[i] = piece[i] - input[i]
}
print(piece.map{String($0)}.joined(separator: " "))
