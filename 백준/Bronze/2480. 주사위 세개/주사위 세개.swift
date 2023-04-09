let input = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)
let set = Set<Int>(input)
switch set.count {
case 1:
    print(10000 + input[0] * 1000)
case 2:
    print(1000 + input[1] * 100)
default:
    print(input[0] * 100)
}
