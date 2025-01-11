let s = Int(readLine()!)!
var sum = 0
var count = 0
while sum + (count + 1) <= s {
    count += 1
    sum += count
}

print(count)
