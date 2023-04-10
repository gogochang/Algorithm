while true {
    let inputArr = readLine()!.split(separator: " ").map{ Int($0)! }
    if inputArr[0] == 0 && inputArr[1] == 0 { break }
    print(inputArr[0] + inputArr[1])
}