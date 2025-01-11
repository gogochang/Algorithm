let s = Int(readLine()!)!
var sum = 0
var count = 0
for i in 1... {
    if sum > s {
        count -= 1
        break
    }
    sum += i
    count += 1
}

print(count)

