var payment = 1000 - Int(readLine()!)!
var count = 0
var arr = [500, 100, 50, 10, 5, 1]

for num in arr {
    if payment == 0 {
        break
    }
    count += payment / num
    payment %= num
}

print(count)

