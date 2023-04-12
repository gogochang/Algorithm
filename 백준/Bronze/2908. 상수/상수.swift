let inputArr = readLine()!.split(separator: " ").map{ Int(String($0.reversed()))!}
print(inputArr[0] > inputArr[1] ? inputArr[0] : inputArr[1])