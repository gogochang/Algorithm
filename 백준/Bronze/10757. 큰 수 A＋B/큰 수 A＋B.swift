var input = readLine()!.split(separator: " ").map{ String($0)}

if input[0].count > input[1].count {
    input[1] = String(repeating: "0", count: input[0].count - input[1].count) + input[1]
} else if input[1].count > input[0].count {
    input[0] = String(repeating: "0", count: input[1].count - input[0].count) + input[0]
}

let num1 = Array(String(input[0].reversed()))
let num2 = Array(String(input[1].reversed()))
var temp = 0
var result: [Int] = []

for i in 0..<num1.count {
    let sum = Int(String(num1[i]))! + Int(String(num2[i]))! + temp
    
    if sum/10 >= 1 {
        temp = 1
    } else {
        temp = 0
    }

    result.append(sum >= 10 ? sum - 10 : sum)
}
if temp >= 1 {
    result.append(temp)
}
print(String(result.map{String($0)}.joined(separator: "").reversed()))


