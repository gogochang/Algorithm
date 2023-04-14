var empty = [[Int]](repeating: Array(repeating: 0, count: 100), count: 100)

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    for j in input[1]..<input[1] + 10  {
        for i in input[0]..<input[0] + 10 {
            empty[i][j] = 1
        }
    }
}
print(empty.flatMap{$0}.reduce(0, +))