var array = Array(1...30)

for _ in 1...28 {
    let input = Int(readLine()!)!
    array[input - 1] = 0
}

print(array.filter{ $0 != 0}.map{String($0)}.joined(separator: " "), terminator: " ")