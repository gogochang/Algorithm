var array: [Int] = []
for _ in 1...9 {
    let input = Int(readLine()!)!
    array.append(input)
}
print(array.max()!)
print(array.firstIndex(of: array.max()!)! + 1)
