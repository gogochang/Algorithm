let digits = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

let input = readLine()!.split(separator: " ").map { Int($0)! }
var N = input[0]
let B = input[1]
var result: [String] = []

while N != 0 {
    result.append(digits[N % B])
    N = N / B
}

print(result.reversed().joined(separator: ""))
