let input = readLine()!.split(separator: " ").map{Int($0)!}
var differencsTime = (input[0] * 60) + input[1] - 45

if differencsTime < 0 {
    differencsTime = (60 * 24) + differencsTime
} else {
    
}
print((differencsTime / 60), (differencsTime % 60))