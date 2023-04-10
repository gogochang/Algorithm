let _ = readLine()
let inputArr = readLine()!.split(separator: " ").map{Int($0)!}
print(inputArr.min()!, inputArr.max()!)