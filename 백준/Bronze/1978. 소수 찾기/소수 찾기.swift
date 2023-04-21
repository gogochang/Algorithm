let _ = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{ Int($0)! }
var result = 0

for i in input {
    var count = 0
    for j in 1...i {
        if i % j == 0 {
            count += 1
        }
    }
    if count == 2 {
        result += 1
    }
}
print(result)
