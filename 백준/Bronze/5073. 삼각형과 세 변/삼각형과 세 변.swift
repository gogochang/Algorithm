while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    let max = input.max() ?? 0
    let sum = input.reduce(0, {$0 + $1})
    
    if input.contains(0) {
        break
    } else if max >= sum - max {
        print("Invalid")
    } else if input[0] == input[1]
        && input[1] == input[2] {
        print("Equilateral")
    } else if input[0] == input[1]
                || input[1] == input[2]
                || input[0] == input[2] {
        print("Isosceles")
    } else {
        print("Scalene")
    }
}