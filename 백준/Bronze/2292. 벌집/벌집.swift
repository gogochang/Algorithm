let input = Int(readLine()!)!
var i = 1
var sum = 1

while true {
    if input <= sum {
        print(i)
        break
    }
    sum = 6 * i + sum
    i += 1
}