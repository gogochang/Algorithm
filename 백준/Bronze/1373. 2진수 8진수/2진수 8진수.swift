var binary = readLine()!.reversed().map { Int(String($0))! }
if binary.count % 3 != 0 {
    binary.append(contentsOf: Array(repeating: 0, count: 3-binary.count%3))
}
binary.reverse()

for i in stride(from: 0, to: binary.count-1, by: 3) {
    print(binary[i]*4 + binary[i+1]*2 + binary[i+2]*1,terminator: "")
}

