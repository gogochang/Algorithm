let input = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map{ Int($0)! }
let target = Int(readLine()!)!
var result = 0

for i in 0..<input {
    if array[i] == target {
        result += 1
    }
}
print(result)
