let inputArr = readLine()!.split(separator: " ").map{Int($0)!}
var array = Array(1...inputArr[0])
var tempArray: [Int] = []

for _ in 1...inputArr[1] {
    var line = readLine()!.split(separator: " ").map{Int($0)!}
    tempArray = array
    for i in line[0] - 1..<line[1] {
        array[i] = tempArray[line[1] - 1 ]
        array[line[1] - 1] = tempArray[i]
        line[1] -= 1
    }
}
print(array.map{ String($0)}.joined(separator: " "))