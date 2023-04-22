let input1 = readLine()!.split(separator: " ").map{Int($0)!}
let input2 = readLine()!.split(separator: " ").map{Int($0)!}
let input3 = readLine()!.split(separator: " ").map{Int($0)!}

var result:[Int] = []

for i in 0..<2 {
    if input1[i] == input2[i] {
        result.append(input3[i])
    }else if input2[i] == input3[i]  {
        result.append(input1[i])
    }else if input1[i] == input3[i] {
        result.append(input2[i])
    }
}

print("\(result[0]) \(result[1])")
