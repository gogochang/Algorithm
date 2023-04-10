let input = Int(readLine()!)!
var result = "int"
for _ in 1...input/4 {
    result = "long " + result
}
print(result)