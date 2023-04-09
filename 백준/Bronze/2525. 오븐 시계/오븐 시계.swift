let inputTime = readLine()!.split(separator: " ").map{Int($0)!}
let inputAddTime = Int(readLine()!)!

var differencsTime = (inputTime[0] * 60) + inputTime[1] + inputAddTime

if differencsTime >= 1440 {
    differencsTime = differencsTime - (60 * 24)
}

print((differencsTime / 60), (differencsTime % 60))