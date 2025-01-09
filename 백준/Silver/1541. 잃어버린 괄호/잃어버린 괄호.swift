let input = readLine()!
let splitByMinus = input.split(separator: "-").map { String($0) }

func sumOfString(_ s: String) -> Int {
    return s.split(separator: "+").map { Int($0)! }.reduce(0, +)
}

let initialSum = sumOfString(splitByMinus[0])
let restSum = splitByMinus.dropFirst().map { sumOfString($0) }.reduce(0, +)
print(initialSum - restSum)
