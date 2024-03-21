var N = Int(readLine()!)!
var bags = 0

while N >= 3 {
    if N % 5 == 0 {
        N -= 5
        bags += 1
    } else {
        N -= 3
        bags += 1
    }
}

if N == 0 {
    print(bags)
} else {
    print(-1)
}