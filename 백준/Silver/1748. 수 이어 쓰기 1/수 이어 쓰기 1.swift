let N = Int(readLine()!)!
var length = 0
var start = 1
var digit = 1

while start <= N {
    let end = min(N , start * 10 - 1)
    length += (end - start + 1) * digit
    start *= 10
    digit += 1
}

print(length)
