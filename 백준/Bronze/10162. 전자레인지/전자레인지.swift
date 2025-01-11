var t = Int(readLine()!)!
var seconds = [300,60,10]
var results = [0,0,0]
for i in 0..<seconds.count {
    results[i] = t / seconds[i]
    t %= seconds[i]
}

print(t == 0 ? results.map{String($0) }.joined(separator: " ") : -1)
