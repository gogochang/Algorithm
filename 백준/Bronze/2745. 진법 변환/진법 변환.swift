let digits = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

let input = readLine()!.split(separator: " ")
var N = input[0]
let B = Int(input[1])!
var nBase = 1
var result = 0

for num in N.reversed() {
    let currentNum = Int(digits.firstIndex(of: String(num))!)
    result += (currentNum * nBase)
    nBase *= B
}
print(result)


