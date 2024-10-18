let inputs = readLine()!.split(separator: " ").map { Int($0)! }
let E = inputs[0]
let S = inputs[1]
let M = inputs[2]
var year = 1
while true {
    if (year-E) % 15 == 0,
       (year-S) % 28 == 0,
       (year-M) % 19 == 0 {
        print(year)
        break
    }
    year += 1
}
