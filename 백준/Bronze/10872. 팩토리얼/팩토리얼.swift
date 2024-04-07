let N = Int(readLine()!)!
var result = 1
if N >= 1 {
    for i in 1...N {
        result *= i
    }
}
print(result)
