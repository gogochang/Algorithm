let inputArr = readLine()!.split(separator: " ").map {Int($0)!}
let numArr = readLine()!.split(separator: " ").map {Int($0)!}
print(numArr.filter {$0 < inputArr[1]}.map{ String($0)}.joined(separator: " "))
