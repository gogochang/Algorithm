while let input = readLine(){
    let inputArr = input.split(separator: " ").map{ Int($0)! }
    print(inputArr[0] + inputArr[1])
}