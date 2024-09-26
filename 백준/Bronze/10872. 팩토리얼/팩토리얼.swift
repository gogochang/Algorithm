let num = Int(readLine()!)!
var result = 1

for n in 1...max(1,num) {
    result *= n
}
print(result)
